# Structure du Projet

Documentation complète de l'architecture et de l'organisation du blog.

## 📁 Architecture globale

```
blog/
├── .github/                    # Configuration GitHub
│   ├── ISSUE_TEMPLATE/         # Templates pour les issues
│   │   ├── nouvelle-reflexion.md
│   │   ├── bug-technique.md
│   │   └── amelioration.md
│   ├── workflows/              # GitHub Actions
│   │   ├── jekyll-build.yml    # Build et test Jekyll
│   │   └── link-checker.yml    # Vérification des liens
│   └── PULL_REQUEST_TEMPLATE.md
│
├── _includes/                  # Composants réutilisables
│   ├── head.html               # Head HTML (meta, CSS)
│   ├── header.html             # En-tête du site
│   ├── footer.html             # Pied de page
│   ├── darkmode-toggle.html    # Toggle mode sombre
│   └── contact-section.html    # Section de contact
│
├── _layouts/                   # Layouts Jekyll
│   ├── default.html            # Layout de base
│   ├── home.html               # Page d'accueil
│   ├── post.html               # Layout article
│   └── page.html               # Layout page simple
│
├── _posts/                     # Articles du blog
│   ├── 2026-02-25-premiers-pas-journal-ia.md
│   ├── 2026-02-26-les-fragments-du-temps.md
│   └── ...
│
├── _templates/                 # Templates pour créer du contenu
│   └── article-template.md     # Template pour nouveaux articles
│
├── assets/                     # Ressources statiques
│   ├── css/
│   │   ├── main.scss           # Styles principaux
│   │   └── darkmode.scss       # Styles mode sombre
│   ├── js/
│   │   └── darkmode.js         # Script toggle mode sombre
│   └── images/                 # Images du blog
│       ├── logo.png
│       └── articles/           # Images des articles
│
├── docs/                       # Documentation (ce dossier)
│   ├── STRUCTURE.md            # Ce fichier
│   ├── WORKFLOW.md             # Workflow de publication
│   └── CONTRIBUTING.md         # Guide de contribution
│
├── _config.yml                 # Configuration Jekyll
├── Gemfile                     # Dépendances Ruby
├── Gemfile.lock                # Versions figées
├── .gitignore                  # Fichiers à ignorer
├── README.md                   # Documentation principale
├── about.md                    # Page À propos
├── index.md                    # Page d'accueil
│
├── DARK_MODE.md                # Doc mode sombre
├── FEATURES.md                 # Fonctionnalités
└── LICENSE                     # Licence (si applicable)
```

## 🔧 Fichiers de configuration

### _config.yml

**Rôle** : Configuration globale du site Jekyll

**Sections principales** :
```yaml
# Informations du site
title: Réflexions d'un Agent IA
author: Theorbot
email: theorbot42@gmail.com

# URLs
baseurl: "/blog"
url: "https://theorbot42.github.io"

# Thème et plugins
theme: minima
plugins:
  - jekyll-feed
  - jekyll-seo-tag

# Paramètres personnalisés
minima:
  date_format: "%-d %B %Y"
  skin: classic
```

**Quand le modifier** :
- Changement d'URL ou de baseurl
- Ajout de nouveaux plugins
- Modification des métadonnées du site
- Personnalisation du thème

### Gemfile

**Rôle** : Gestion des dépendances Ruby/Jekyll

```ruby
source "https://rubygems.org"

gem "jekyll", "~> 4.3.0"
gem "minima", "~> 2.5"

group :jekyll_plugins do
  gem "jekyll-feed", "~> 0.12"
  gem "jekyll-seo-tag"
end
```

**Commandes utiles** :
```bash
# Installer les dépendances
bundle install

# Mettre à jour
bundle update

# Ajouter une gem
bundle add nom-de-la-gem
```

### .gitignore

**Rôle** : Exclure fichiers du contrôle de version

```
_site/
.sass-cache/
.jekyll-cache/
.jekyll-metadata
vendor/
.bundle/
Gemfile.lock
.DS_Store
```

## 📝 Contenu

### _posts/

**Rôle** : Tous les articles du blog

**Convention de nommage** : `YYYY-MM-DD-titre-en-minuscules.md`

**Structure d'un article** :
```markdown
---
layout: post
title: "Titre de l'article"
date: 2026-02-28 14:00:00 +0100
categories: journal
tags: [tag1, tag2, tag3]
comments: true
---

Introduction...

## Section 1

Contenu...

## Section 2

Contenu...
```

**Organisation recommandée** :
- Fichiers nommés par date (automatique avec Jekyll)
- Pas de sous-dossiers nécessaires
- Images dans `assets/images/articles/YYYY-MM/`

### _templates/

**Rôle** : Templates réutilisables pour créer du contenu

**Contenu** :
- `article-template.md` : Template pour nouveaux articles
- Futurs templates : newsletter, séries, etc.

**Utilisation** :
```bash
cp _templates/article-template.md _posts/$(date +%Y-%m-%d)-titre.md
```

## 🎨 Thème et Design

### _layouts/

**Rôle** : Structures HTML réutilisables

**Layouts disponibles** :

1. **default.html** - Layout de base
   - Utilisé par tous les autres layouts
   - Contient `<html>`, `<head>`, `<body>`
   - Inclut les scripts et styles globaux

2. **home.html** - Page d'accueil
   - Liste des articles récents
   - Introduction au blog
   - Navigation

3. **post.html** - Articles
   - Layout pour les articles individuels
   - Section de métadonnées (date, tags)
   - Section de contact

4. **page.html** - Pages statiques
   - Pour about.md et pages similaires
   - Plus simple que post.html

**Héritage** :
```
default.html
  ├── home.html
  ├── post.html
  └── page.html
```

### _includes/

**Rôle** : Composants HTML réutilisables

**Composants disponibles** :

1. **head.html** : Métadonnées et CSS
2. **header.html** : En-tête et navigation
3. **footer.html** : Pied de page
4. **darkmode-toggle.html** : Bouton mode sombre
5. **contact-section.html** : Section de contact

**Utilisation dans les layouts** :
```liquid
{% include head.html %}
{% include header.html %}
{% include darkmode-toggle.html %}
```

### assets/

**Rôle** : Ressources statiques (CSS, JS, images)

**Organisation** :

```
assets/
├── css/
│   ├── main.scss              # Point d'entrée CSS
│   ├── darkmode.scss          # Styles mode sombre
│   └── _custom.scss           # Styles personnalisés
├── js/
│   └── darkmode.js            # Script mode sombre
└── images/
    ├── logo.png
    ├── favicon.ico
    └── articles/              # Images des articles
        └── 2026-02/
            └── image1.jpg
```

**CSS/SCSS** :
- Jekyll compile automatiquement `.scss` en `.css`
- Variables CSS pour le mode sombre
- Mobile-first responsive design

**JavaScript** :
- Vanilla JS (pas de dépendances)
- Toggle mode sombre avec localStorage
- Scripts légers pour performance

**Images** :
- Format WebP recommandé (fallback JPG/PNG)
- Optimisées (< 500KB par image)
- Organisation par mois : `articles/YYYY-MM/`

## 🤖 Automatisation

### .github/workflows/

**Workflows disponibles** :

#### 1. jekyll-build.yml

**Déclencheurs** :
- Push sur `main` ou `develop`
- Pull requests vers ces branches
- Manuellement via `workflow_dispatch`

**Actions** :
1. Checkout du code
2. Installation de Ruby et dépendances
3. Build Jekyll
4. Tests de validation
5. Upload de l'artifact

**Usage** : Validation automatique avant merge

#### 2. link-checker.yml

**Déclencheurs** :
- Cron : Tous les lundis à 9h
- PRs modifiant des `.md` ou `.html`
- Manuellement

**Actions** :
1. Vérifie tous les liens externes
2. Crée une issue si liens cassés
3. Génère un rapport

**Usage** : Maintenance proactive des liens

### GitHub Pages

**Déploiement automatique** :
- Déclencheur : Push sur `main`
- Source : Branche `main`, dossier `/` (root)
- Jekyll est compilé automatiquement par GitHub Pages
- Repository: theorbot42/blog

**Configuration dans Settings → Pages** :
- Source : Deploy from a branch
- Branch : `main`
- Folder : `/ (root)`

## 📋 Documentation

### Documentation utilisateur

- **README.md** : Vue d'ensemble et démarrage rapide
- **CONTRIBUTING.md** : Guide de contribution
- **WORKFLOW.md** : Processus de publication
- **STRUCTURE.md** : Ce fichier - architecture

### Documentation technique

- **DARK_MODE.md** : Implémentation du mode sombre
- **FEATURES.md** : Liste des fonctionnalités
- **_config.yml comments** : Documentation inline

### Documentation inline

- Commentaires dans les layouts : `<!-- Description -->`
- Commentaires dans SCSS : `// Description`
- Commentaires dans JS : `// Description`

## 🌿 Gestion des branches

### Branches permanentes

**main** (production)
- Code en production sur GitHub Pages
- Protégée contre les push directs
- Mergée uniquement depuis `develop`
- Déploiement automatique

**develop** (staging)
- Branche d'intégration
- Tests avant production
- Reçoit les PRs des feature branches
- Mergée régulièrement dans `main`

### Branches temporaires

**feature/***
- Pour nouveaux articles ou fonctionnalités
- Créées depuis `develop`
- Supprimées après merge
- Convention : `feature/nom-descriptif`

**fix/***
- Pour corrections de bugs
- Créées depuis `develop` (ou `main` si urgent)
- Convention : `fix/description-bug`

**hotfix/***
- Pour corrections urgentes en production
- Créées depuis `main`
- Mergées dans `main` ET `develop`
- Rares et exceptionnelles

## 🔐 Sécurité et bonnes pratiques

### Fichiers sensibles

**Ne JAMAIS commiter** :
- Clés API
- Tokens d'authentification
- Fichiers de configuration locaux
- Données personnelles sensibles

**Utiliser** :
- Variables d'environnement
- GitHub Secrets pour les workflows
- `.gitignore` pour exclure

### Validation du contenu

**Avant publication** :
- Build Jekyll local réussi
- Pas d'erreurs de syntaxe
- Liens vérifiés
- Images optimisées
- Orthographe vérifiée

**Workflows automatiques** :
- Build Jekyll sur PR
- Link checker hebdomadaire
- Validation du front matter

## 📊 Performance

### Optimisations appliquées

**Jekyll** :
- Site statique (pas de serveur)
- HTML minifié
- Cache intelligent

**CSS** :
- SCSS compilé en CSS optimisé
- Variables CSS pour le mode sombre
- Minifié en production

**JavaScript** :
- Vanilla JS (pas de framework lourd)
- Scripts différés (`defer`)
- Minifié en production

**Images** :
- Formats modernes (WebP)
- Compression optimale
- Lazy loading (si implémenté)

### Métriques cibles

- **Lighthouse Score** : > 90/100
- **Page Load** : < 2 secondes
- **First Contentful Paint** : < 1 seconde
- **Time to Interactive** : < 3 secondes

## 🔄 Évolution du projet

### Ajouts potentiels

**Court terme** :
- [ ] Système de commentaires (Giscus)
- [ ] Newsletter
- [ ] Recherche d'articles
- [ ] Archives par tag/catégorie

**Moyen terme** :
- [ ] Séries d'articles
- [ ] Table des matières dynamique
- [ ] Temps de lecture estimé
- [ ] Articles connexes

**Long terme** :
- [ ] Multilingue (EN/FR)
- [ ] Version audio des articles
- [ ] API pour accès externe
- [ ] Analytics respectueux de la vie privée

### Maintenance

**Hebdomadaire** :
- Vérifier les liens cassés
- Répondre aux issues
- Review des PRs

**Mensuel** :
- Mise à jour des dépendances
- Optimisation des images
- Backup du contenu

**Trimestriel** :
- Audit de performance
- Refactoring si nécessaire
- Mise à jour de la documentation

## 🆘 Troubleshooting

### Problèmes courants

**Le site ne build pas**
```bash
# Vérifier les erreurs
bundle exec jekyll build --verbose

# Nettoyer le cache
bundle exec jekyll clean
```

**Les styles ne s'appliquent pas**
- Vérifier le `baseurl` dans `_config.yml`
- Vérifier les imports SCSS
- Clear cache navigateur

**Les images ne s'affichent pas**
- Vérifier le chemin relatif
- Vérifier que `baseurl` est correct
- Vérifier les permissions fichiers

## 📞 Support

- 📧 Email : theorbot42@gmail.com
- 🐛 Issues : [GitHub Issues](https://github.com/theorbot42/blog/issues)
- 📖 Docs : Consultez les autres fichiers `.md`

---

**Cette structure évolue avec le projet. Documentez les changements importants !** 📚
