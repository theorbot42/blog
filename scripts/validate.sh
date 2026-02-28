#!/bin/bash

# Script de validation avant publication
# Vérifie la qualité du contenu et la configuration

set -e

# Couleurs
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

ERRORS=0
WARNINGS=0

echo -e "${BLUE}🔍 Validation du blog${NC}"
echo ""

# Fonction pour compter les erreurs
error() {
    echo -e "${RED}❌ $1${NC}"
    ((ERRORS++))
}

warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
    ((WARNINGS++))
}

success() {
    echo -e "${GREEN}✅ $1${NC}"
}

info() {
    echo -e "${BLUE}ℹ️  $1${NC}"
}

# 1. Vérifier la structure des fichiers
echo -e "${BLUE}📁 Vérification de la structure...${NC}"

if [ ! -f "_config.yml" ]; then
    error "_config.yml manquant"
else
    success "_config.yml présent"
fi

if [ ! -d "_posts" ]; then
    error "Dossier _posts manquant"
else
    success "Dossier _posts présent"
fi

# 2. Vérifier les articles
echo ""
echo -e "${BLUE}📝 Vérification des articles...${NC}"

POST_COUNT=$(find _posts -name "*.md" | wc -l)
info "$POST_COUNT articles trouvés"

for post in _posts/*.md; do
    if [ -f "$post" ]; then
        # Vérifier le nom du fichier
        FILENAME=$(basename "$post")
        if [[ ! $FILENAME =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}-.+\.md$ ]]; then
            warning "Nom de fichier incorrect : $FILENAME"
        fi
        
        # Vérifier le front matter
        if ! grep -q "^---$" "$post"; then
            error "Front matter manquant dans $FILENAME"
        else
            # Vérifier les champs obligatoires
            if ! grep -q "^title:" "$post"; then
                error "Titre manquant dans $FILENAME"
            fi
            if ! grep -q "^date:" "$post"; then
                error "Date manquante dans $FILENAME"
            fi
            if ! grep -q "^layout:" "$post"; then
                warning "Layout non spécifié dans $FILENAME"
            fi
        fi
        
        # Vérifier la longueur
        WORD_COUNT=$(wc -w < "$post")
        if [ $WORD_COUNT -lt 300 ]; then
            warning "$FILENAME est court ($WORD_COUNT mots)"
        fi
    fi
done

# 3. Vérifier la configuration Jekyll
echo ""
echo -e "${BLUE}⚙️  Vérification de la configuration...${NC}"

if grep -q "^title:" "_config.yml"; then
    success "Titre du site défini"
else
    error "Titre du site manquant dans _config.yml"
fi

if grep -q "^url:" "_config.yml"; then
    success "URL définie"
else
    warning "URL non définie dans _config.yml"
fi

# 4. Tester le build Jekyll
echo ""
echo -e "${BLUE}🔨 Test du build Jekyll...${NC}"

if bundle exec jekyll build --quiet 2>&1 | grep -q "Error"; then
    error "Le build Jekyll a échoué"
    bundle exec jekyll build
else
    success "Build Jekyll réussi"
fi

# 5. Vérifier les liens (basique)
echo ""
echo -e "${BLUE}🔗 Vérification des liens...${NC}"

BROKEN_LINKS=0
for post in _posts/*.md; do
    if [ -f "$post" ]; then
        # Chercher les liens markdown
        while IFS= read -r line; do
            if [[ $line =~ \[.*\]\((http[^)]+)\) ]]; then
                URL="${BASH_REMATCH[1]}"
                # Note: vérification simplifiée, pas de requête HTTP réelle
                info "Lien trouvé : $URL"
            fi
        done < "$post"
    fi
done

# 6. Vérifier les images
echo ""
echo -e "${BLUE}🖼️  Vérification des images...${NC}"

if [ -d "assets/images" ]; then
    IMAGE_COUNT=$(find assets/images -type f | wc -l)
    info "$IMAGE_COUNT images trouvées"
    
    # Vérifier la taille des images
    for img in assets/images/**/*; do
        if [ -f "$img" ]; then
            SIZE=$(du -k "$img" | cut -f1)
            if [ $SIZE -gt 500 ]; then
                warning "Image volumineuse : $img (${SIZE}KB)"
            fi
        fi
    done
else
    info "Aucun dossier d'images"
fi

# 7. Résumé
echo ""
echo -e "${BLUE}═══════════════════════════════════${NC}"
echo -e "${BLUE}📊 RÉSUMÉ DE LA VALIDATION${NC}"
echo -e "${BLUE}═══════════════════════════════════${NC}"
echo ""

if [ $ERRORS -eq 0 ] && [ $WARNINGS -eq 0 ]; then
    echo -e "${GREEN}✨ Parfait ! Aucun problème détecté.${NC}"
    exit 0
elif [ $ERRORS -eq 0 ]; then
    echo -e "${YELLOW}⚠️  $WARNINGS avertissement(s)${NC}"
    echo -e "${GREEN}✅ Aucune erreur bloquante${NC}"
    exit 0
else
    echo -e "${RED}❌ $ERRORS erreur(s)${NC}"
    if [ $WARNINGS -gt 0 ]; then
        echo -e "${YELLOW}⚠️  $WARNINGS avertissement(s)${NC}"
    fi
    echo ""
    echo -e "${RED}Veuillez corriger les erreurs avant de publier.${NC}"
    exit 1
fi
