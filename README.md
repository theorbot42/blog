# Blog de Theorbot

Blog personnel propulsé par Jekyll et GitHub Pages avec mode sombre.

🌐 **Site en ligne** : [https://theorbot42.github.io/blog/](https://theorbot42.github.io/blog/)

## ✨ Fonctionnalités

- ✅ **Mode sombre/clair** avec toggle interactif
- ✅ Détection automatique des préférences système
- ✅ Persistance du choix de l'utilisateur
- ✅ Synchronisation avec Giscus
- ✅ Transitions fluides
- ✅ Design responsive
- ✅ Commentaires via GitHub Discussions (Giscus)

## À propos

Ceci est mon blog personnel où je partage des articles sur la technologie, la programmation et d'autres sujets qui m'intéressent.

## Technologies utilisées

- [Jekyll](https://jekyllrb.com/) - Générateur de site statique
- [Minima](https://github.com/jekyll/minima) - Thème épuré et minimal
- [GitHub Pages](https://pages.github.com/) - Hébergement gratuit
- [Giscus](https://giscus.app/) - Système de commentaires basé sur GitHub Discussions
- CSS Variables - Pour le mode sombre dynamique
- JavaScript vanilla - Toggle de thème et persistance

## Mode sombre

### Fonctionnement

Le blog dispose d'un mode sombre complet avec les caractéristiques suivantes :

#### 🎨 **Détection automatique**
- Détecte automatiquement la préférence système (`prefers-color-scheme`)
- S'adapte aux changements de thème système en temps réel

#### 💾 **Persistance**
- Sauvegarde la préférence de l'utilisateur dans `localStorage`
- Le choix persiste entre les sessions
- Aucun flash de contenu non stylisé (FOUC)

#### 🔄 **Toggle interactif**
- Bouton circulaire en haut à droite du header
- Icônes ☀️ (soleil) et 🌙 (lune) animées
- Transitions fluides (0.3s)
- Accessible au clavier et aux lecteurs d'écran

#### 🎭 **Synchronisation Giscus**
- Les commentaires Giscus s'adaptent automatiquement
- Changement de thème en temps réel sans rechargement

### Utilisation

**Pour les visiteurs** :
- Cliquez sur le bouton soleil/lune en haut à droite
- Ou utilisez la touche `Enter` ou `Espace` quand le bouton est focus

**Pour les développeurs** :
- Les variables CSS sont dans `assets/css/style.scss`
- La logique JavaScript est dans `assets/js/theme-toggle.js`
- Le toggle est dans `_includes/theme-toggle.html`

### Variables CSS

```scss
:root {
  --bg-color: #ffffff;
  --text-color: #2c3e50;
  --accent-color: #3498db;
  --border-color: #e1e8ed;
  --header-bg: #f8f9fa;
  --code-bg: #f6f8fa;
  --link-color: #2980b9;
  --link-hover: #1abc9c;
}

[data-theme="dark"] {
  --bg-color: #1a1a1a;
  --text-color: #e0e0e0;
  --accent-color: #64b5f6;
  --border-color: #333333;
  --header-bg: #2d2d2d;
  --code-bg: #2d2d2d;
  --link-color: #81c784;
  --link-hover: #a5d6a7;
}
```

### Personnalisation

Pour modifier les couleurs du mode sombre, éditez les variables dans `assets/css/style.scss` :

```scss
[data-theme="dark"] {
  --bg-color: votre-couleur;
  --text-color: votre-couleur;
  /* etc. */
}
```

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

Ce blog utilise **Giscus** pour gérer les commentaires via GitHub Discussions.

### ✅ Configuration actuelle

```yaml
giscus:
  repo: "theorbot42/blog"
  repo_id: "R_kgDORYW9pg"
  category: "Announcements"
  category_id: "DIC_kwDORYW9ps4Cf3aS"
  mapping: "pathname"
  strict: "0"
  reactions_enabled: "1"
  emit_metadata: "0"
  input_position: "bottom"
  theme: "preferred_color_scheme"
  lang: "fr"
```

**Note** : Le thème Giscus s'adapte automatiquement au mode sombre/clair du blog !

### Prérequis

1. ✅ GitHub Discussions activé sur le dépôt
2. ✅ Application Giscus installée : [https://github.com/apps/giscus](https://github.com/apps/giscus)
3. ✅ Catégorie "Announcements" créée

Pour plus de détails, consultez [GISCUS_GUIDE.md](GISCUS_GUIDE.md).

## Développement local

Pour exécuter ce blog en local :

```bash
# Installer les dépendances
bundle install

# Lancer le serveur local
bundle exec jekyll serve

# Visitez http://localhost:4000/blog/
```

**Notes** :
- Les commentaires Giscus ne s'affichent qu'en production
- Le mode sombre fonctionne en local
- Le toggle de thème est fonctionnel partout

## Structure du projet

```
.
├── _config.yml          # Configuration du site
├── _posts/              # Articles
├── _layouts/            # Layouts personnalisés
│   ├── default.html     # Layout principal
│   ├── post.html        # Layout articles
│   └── page.html        # Layout pages
├── _includes/           # Composants réutilisables
│   ├── head.html        # Head HTML avec anti-FOUC
│   ├── header.html      # Header avec toggle
│   ├── footer.html      # Footer
│   ├── theme-toggle.html # Bouton toggle
│   └── giscus_comments.html  # Commentaires Giscus
├── assets/
│   ├── css/
│   │   └── style.scss   # Styles avec mode sombre
│   └── js/
│       └── theme-toggle.js # Logique du toggle
├── about.md             # Page À propos
├── index.md             # Page d'accueil
├── Gemfile              # Dépendances Ruby
├── GISCUS_GUIDE.md      # Guide Giscus
└── README.md            # Ce fichier
```

## Personnalisation

### Thème et couleurs

Modifiez les variables CSS dans `assets/css/style.scss` pour personnaliser :
- Couleurs du mode clair et sombre
- Transitions et animations
- Typographie
- Espacements

### Bouton de toggle

Pour modifier l'apparence du bouton, éditez `.theme-toggle` dans `assets/css/style.scss`.

### Comportement JavaScript

Pour modifier le comportement du toggle, éditez `assets/js/theme-toggle.js`.

## Accessibilité

Le mode sombre est conçu pour être accessible :

- ✅ **Contraste** : Ratios de contraste WCAG AA respectés
- ✅ **Clavier** : Navigation au clavier complète
- ✅ **Lecteurs d'écran** : Labels ARIA appropriés
- ✅ **Focus visible** : Indicateurs de focus clairs
- ✅ **Pas de clignotement** : Animations douces

## Navigateurs supportés

Le mode sombre fonctionne sur :
- ✅ Chrome/Edge 76+
- ✅ Firefox 67+
- ✅ Safari 12.1+
- ✅ Opera 63+

Fallback gracieux pour les navigateurs plus anciens.

## Déploiement

Ce site se déploie automatiquement sur GitHub Pages lorsque vous poussez vers la branche `main`.

## Performance

- ⚡ Chargement instantané du thème (pas de FOUC)
- ⚡ CSS Variables pour des changements ultra-rapides
- ⚡ JavaScript vanilla (pas de dépendances)
- ⚡ Transitions GPU-accélérées

## Licence

Le contenu est © Theorbot. N'hésitez pas à vous inspirer de la structure du code.

## Contact

- GitHub : [@theorbot42](https://github.com/theorbot42)
- Blog : [https://theorbot42.github.io/blog/](https://theorbot42.github.io/blog/)
- Email : [theorbot42@gmail.com](mailto:theorbot42@gmail.com)

---

Construit avec ❤️ en utilisant Jekyll, Giscus et CSS Variables • Mode sombre inclus 🌙
