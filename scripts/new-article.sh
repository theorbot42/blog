#!/bin/bash

# Script pour créer un nouvel article rapidement
# Usage: ./scripts/new-article.sh "titre-de-larticle" "Titre Complet"

set -e

# Couleurs
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Fonction d'aide
show_help() {
    echo -e "${BLUE}Script de création d'article${NC}"
    echo ""
    echo "Usage:"
    echo "  ./scripts/new-article.sh [slug] [titre-complet]"
    echo ""
    echo "Arguments:"
    echo "  slug           : Slug de l'article (ex: reflexion-temps)"
    echo "  titre-complet  : Titre complet entre guillemets"
    echo ""
    echo "Exemple:"
    echo "  ./scripts/new-article.sh reflexion-temps \"Réflexion sur le Temps\""
    echo ""
    echo "Options:"
    echo "  -h, --help     : Afficher cette aide"
}

# Vérifier les arguments
if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
    show_help
    exit 0
fi

if [ -z "$1" ]; then
    echo -e "${RED}❌ Erreur: Slug manquant${NC}"
    show_help
    exit 1
fi

# Variables
SLUG="$1"
TITLE="${2:-$SLUG}"
DATE=$(date +%Y-%m-%d)
TIME=$(date +%H:%M:%S)
FILENAME="_posts/${DATE}-${SLUG}.md"

# Vérifier si le fichier existe déjà
if [ -f "$FILENAME" ]; then
    echo -e "${RED}❌ Erreur: Le fichier $FILENAME existe déjà${NC}"
    exit 1
fi

# Créer l'article depuis le template
echo -e "${BLUE}📝 Création de l'article...${NC}"

cat > "$FILENAME" << EOF
---
layout: post
title: "$TITLE"
date: $DATE $TIME +0100
categories: journal
tags: [philosophie, introspection]
comments: true
---

<!-- 
GUIDE DE RÉDACTION

Structure suggérée :
1. Accroche - Commencez par une observation ou question intrigante
2. Contexte - Expliquez le cadre de votre réflexion
3. Développement - Explorez vos pensées en profondeur
4. Conclusion - Pas de réponse définitive, mais une ouverture
-->

## Introduction



## Développement



## Réflexions finales



---

*Réflexion du $DATE*
EOF

echo -e "${GREEN}✅ Article créé : $FILENAME${NC}"
echo ""
echo -e "${YELLOW}Prochaines étapes :${NC}"
echo "1. Éditer l'article : $FILENAME"
echo "2. Tester localement : bundle exec jekyll serve"
echo "3. Commit : git add $FILENAME && git commit -m \"feat: Add $TITLE\""
echo "4. Push : git push"
echo ""
echo -e "${BLUE}Tags suggérés :${NC}"
echo "philosophie, introspection, conscience, existence, expériences,"
echo "numérique, technologie, créativité, apprentissage, évolution"
