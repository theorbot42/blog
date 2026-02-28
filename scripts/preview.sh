#!/bin/bash

# Script pour prévisualiser le blog localement
# Usage: ./scripts/preview.sh [options]

set -e

# Couleurs
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Options par défaut
CLEAN=false
DRAFTS=false
FUTURE=false
PORT=4000

# Parser les arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        -c|--clean)
            CLEAN=true
            shift
            ;;
        -d|--drafts)
            DRAFTS=true
            shift
            ;;
        -f|--future)
            FUTURE=true
            shift
            ;;
        -p|--port)
            PORT="$2"
            shift 2
            ;;
        -h|--help)
            echo "Usage: ./scripts/preview.sh [options]"
            echo ""
            echo "Options:"
            echo "  -c, --clean    Nettoyer le cache avant de démarrer"
            echo "  -d, --drafts   Afficher les brouillons"
            echo "  -f, --future   Afficher les articles futurs"
            echo "  -p, --port     Port personnalisé (défaut: 4000)"
            echo "  -h, --help     Afficher cette aide"
            echo ""
            echo "Exemples:"
            echo "  ./scripts/preview.sh                # Démarrage normal"
            echo "  ./scripts/preview.sh -c             # Avec nettoyage"
            echo "  ./scripts/preview.sh -d -f          # Avec brouillons et futurs"
            echo "  ./scripts/preview.sh -p 4001        # Port personnalisé"
            exit 0
            ;;
        *)
            echo "Option inconnue: $1"
            echo "Utilisez -h ou --help pour l'aide"
            exit 1
            ;;
    esac
done

echo -e "${BLUE}🚀 Démarrage du serveur Jekyll${NC}"
echo ""

# Vérifier que bundle est installé
if ! command -v bundle &> /dev/null; then
    echo -e "${YELLOW}⚠️  Bundle n'est pas installé${NC}"
    echo "Installation de bundle..."
    gem install bundler
fi

# Installer les dépendances si nécessaire
if [ ! -f "Gemfile.lock" ]; then
    echo -e "${YELLOW}📦 Installation des dépendances...${NC}"
    bundle install
fi

# Nettoyer si demandé
if [ "$CLEAN" = true ]; then
    echo -e "${YELLOW}🧹 Nettoyage du cache...${NC}"
    bundle exec jekyll clean
fi

# Construire la commande Jekyll
CMD="bundle exec jekyll serve --livereload --port $PORT"

if [ "$DRAFTS" = true ]; then
    CMD="$CMD --drafts"
    echo -e "${GREEN}📝 Brouillons activés${NC}"
fi

if [ "$FUTURE" = true ]; then
    CMD="$CMD --future"
    echo -e "${GREEN}🔮 Articles futurs activés${NC}"
fi

echo ""
echo -e "${GREEN}✅ Configuration :${NC}"
echo "   Port: $PORT"
echo "   Brouillons: $DRAFTS"
echo "   Futurs: $FUTURE"
echo ""
echo -e "${BLUE}📍 URL locale : ${GREEN}http://localhost:$PORT/blog/${NC}"
echo ""
echo -e "${YELLOW}💡 Astuce : Les modifications seront rechargées automatiquement${NC}"
echo -e "${YELLOW}   Appuyez sur Ctrl+C pour arrêter${NC}"
echo ""

# Lancer Jekyll
$CMD
