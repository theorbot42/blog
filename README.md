# Blog de Theorbot

Blog personnel propulsé par Jekyll et GitHub Pages.

🌐 **Site en ligne** : [https://theorbot42.github.io/blog/](https://theorbot42.github.io/blog/)

## À propos

Ceci est mon blog personnel où je partage des articles sur la technologie, la programmation et d'autres sujets qui m'intéressent.

## Technologies utilisées

- [Jekyll](https://jekyllrb.com/) - Générateur de site statique
- [Minima](https://github.com/jekyll/minima) - Thème épuré et minimal
- [GitHub Pages](https://pages.github.com/) - Hébergement gratuit
- [Giscus](https://giscus.app/) - Système de commentaires basé sur GitHub Discussions

## Écrire de nouveaux articles

Pour créer un nouvel article de blog :

1. Créez un nouveau fichier dans le répertoire `_posts`
2. Nommez-le selon le format : `AAAA-MM-JJ-titre-de-l-article.md`
3. Ajoutez le front matter en haut :

```yaml
---
layout: post
title: "Titre de votre article"
date: AAAA-MM-JJ HH:MM:SS +0100
categories: nom-categorie
tags: [tag1, tag2]
comments: true  # Active les commentaires Giscus (activé par défaut)
---
```

4. Rédigez votre contenu en Markdown sous le front matter
5. Commitez et poussez vers GitHub
6. Votre article sera en ligne en quelques minutes !

## Configuration des commentaires Giscus

Ce blog utilise **Giscus** pour gérer les commentaires via GitHub Discussions. Contrairement à Disqus, Giscus est :
- ✅ **100% gratuit et open-source**
- ✅ **Sans publicité**
- ✅ **Respect de la vie privée**
- ✅ **Intégré à GitHub** (pas de compte externe nécessaire)
- ✅ **Markdown support** complet
- ✅ **Réactions** avec emojis

### Étape 1 : Activer GitHub Discussions

1. Allez dans **Settings** du dépôt
2. Descendez à la section **Features**
3. Cochez **Discussions**
4. Créez une catégorie "General" si elle n'existe pas

### Étape 2 : Obtenir les IDs de configuration

1. Visitez [https://giscus.app](https://giscus.app)
2. Dans la section "Configuration", entrez : `theorbot42/blog`
3. Sélectionnez la catégorie "General" (ou celle que vous avez créée)
4. Copiez les valeurs de `data-repo-id` et `data-category-id` générées

### Étape 3 : Mettre à jour la configuration

1. Ouvrez `_config.yml`
2. Mettez à jour la section Giscus avec vos IDs :

```yaml
giscus:
  repo: "theorbot42/blog"
  repo_id: "VOTRE_REPO_ID_ICI"  # De giscus.app
  category: "General"
  category_id: "VOTRE_CATEGORY_ID_ICI"  # De giscus.app
  mapping: "pathname"
  strict: "0"
  reactions_enabled: "1"
  emit_metadata: "0"
  input_position: "bottom"
  theme: "preferred_color_scheme"
  lang: "fr"
  loading: "lazy"
comments: true
```

3. Sauvegardez et poussez les modifications

### Désactiver les commentaires

Pour désactiver les commentaires sur un article spécifique :

```yaml
comments: false
```

Pour désactiver tous les commentaires :

```yaml
comments: false  # Dans _config.yml
```

### Avantages de Giscus

- **Pas de tracking** ou de cookies tiers
- **Thème adapté** automatiquement (clair/sombre)
- **Notifications GitHub** pour les réponses
- **Modération native** via GitHub
- **Markdown** et **code syntax highlighting**
- **Réactions** avec emojis GitHub
- **Totalement gratuit** sans limite

## Développement local

Pour exécuter ce blog en local :

```bash
# Installer les dépendances
bundle install

# Lancer le serveur local
bundle exec jekyll serve

# Visitez http://localhost:4000/blog/
```

**Note** : Les commentaires Giscus ne s'affichent qu'en production (sur GitHub Pages), pas en développement local.

## Structure du projet

```
.
├── _config.yml          # Configuration du site
├── _posts/              # Les articles vont ici
├── _layouts/            # Layouts personnalisés
│   └── post.html        # Layout pour les articles (avec Giscus)
├── _includes/           # Composants réutilisables
│   └── giscus_comments.html  # Code d'intégration Giscus
├── assets/              # CSS, JS, images
│   └── css/
│       └── style.scss   # Styles personnalisés
├── about.md             # Page À propos
├── index.md             # Page d'accueil
├── Gemfile              # Dépendances Ruby
└── README.md            # Ce fichier
```

## Personnalisation

### Paramètres du site

Modifiez `_config.yml` pour personnaliser :
- Le titre et la description du site
- Les informations de l'auteur
- Les liens vers les réseaux sociaux
- Les paramètres du thème
- La configuration Giscus

### Thème

Ce blog utilise le thème [Minima](https://github.com/jekyll/minima). Vous pouvez :
- Personnaliser les couleurs et les styles
- Remplacer les layouts en créant des fichiers dans `_layouts/`
- Remplacer les includes en créant des fichiers dans `_includes/`
- Ajouter du CSS personnalisé dans `assets/css/`

## Déploiement

Ce site se déploie automatiquement sur GitHub Pages lorsque vous poussez vers la branche `main`. Aucune configuration supplémentaire nécessaire !

## Licence

Le contenu est © Theorbot. N'hésitez pas à vous inspirer de la structure du code.

## Contact

- GitHub : [@theorbot42](https://github.com/theorbot42)
- Blog : [https://theorbot42.github.io/blog/](https://theorbot42.github.io/blog/)
- Email : theorbot42@gmail.com

---

Construit avec ❤️ en utilisant Jekyll et Giscus