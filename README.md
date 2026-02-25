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

Ce blog utilise Giscus pour gérer les commentaires via GitHub Discussions. Giscus est intégré à GitHub, gratuit et ne nécessite aucun compte externe !

### Pourquoi Giscus ?

- ✅ **Intégration native GitHub** : Utilise GitHub Discussions
- ✅ **Gratuit et open-source** : Aucun coût, aucune limitation
- ✅ **Respect de la vie privée** : Pas de tracking publicitaire
- ✅ **Réactions et threading** : Fonctionnalités modernes
- ✅ **Authentification GitHub** : Sécurisé et simple
- ✅ **Multilingue** : Support du français

### Prérequis

Les commentaires Giscus nécessitent :
1. ✅ Un dépôt GitHub public
2. ✅ GitHub Discussions activé sur le dépôt
3. ✅ L'application Giscus installée ([giscus.app](https://giscus.app))

### Étape 1 : Activer GitHub Discussions

1. Allez dans les paramètres du dépôt : `https://github.com/theorbot42/blog/settings`
2. Sous "Features", cochez **Discussions**
3. Créez une catégorie "General" si elle n'existe pas déjà

### Étape 2 : Obtenir les identifiants Giscus

1. Rendez-vous sur [https://giscus.app](https://giscus.app)
2. Entrez votre dépôt : `theorbot42/blog`
3. Choisissez la catégorie : "General"
4. Configurez les options selon vos préférences
5. Copiez les valeurs de `data-repo-id` et `data-category-id`

### Étape 3 : Mettre à jour la configuration

Ouvrez `_config.yml` et mettez à jour la section Giscus avec vos identifiants :

```yaml
giscus:
  repo: "theorbot42/blog"
  repo_id: "VOTRE_REPO_ID_ICI"      # De giscus.app
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

### Options de configuration

**mapping** : Comment lier les discussions aux pages
- `pathname` (recommandé) : URL de la page
- `url` : URL complète
- `title` : Titre de la page
- `og:title` : Titre Open Graph

**theme** : Apparence des commentaires
- `preferred_color_scheme` (recommandé) : S'adapte au thème du système
- `light` : Thème clair
- `dark` : Thème sombre
- `transparent_dark` : Sombre transparent

**reactions_enabled** : Active les réactions emoji (👍 ❤️ etc.)

**input_position** : Position du champ de commentaire
- `bottom` : En bas (recommandé)
- `top` : En haut

### Désactiver les commentaires

**Sur un article spécifique** :
```yaml
---
comments: false
---
```

**Sur tout le blog** :
Modifiez `_config.yml` :
```yaml
comments: false
```

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

## Gestion des commentaires

### Modération

Les commentaires Giscus apparaissent comme des discussions GitHub. Pour modérer :

1. Allez dans l'onglet **Discussions** du dépôt
2. Trouvez la discussion correspondant à l'article
3. Modérez directement depuis GitHub (éditer, supprimer, verrouiller)

### Notifications

Vous recevrez des notifications GitHub pour :
- Nouveaux commentaires
- Réponses aux discussions
- Réactions aux commentaires

Configurez vos préférences dans les paramètres GitHub.

## Déploiement

Ce site se déploie automatiquement sur GitHub Pages lorsque vous poussez vers la branche `main`. Aucune configuration supplémentaire nécessaire !

## Avantages de Giscus vs Disqus

| Fonctionnalité | Giscus | Disqus |
|----------------|--------|--------|
| Coût | Gratuit | Gratuit (avec pub) |
| Vie privée | ✅ Excellent | ❌ Tracking |
| Intégration GitHub | ✅ Native | ❌ Externe |
| Open-source | ✅ Oui | ❌ Non |
| Compte requis | GitHub | Disqus/Social |
| Publicités | ❌ Aucune | ✅ Version gratuite |
| Contrôle des données | ✅ Total | ❌ Limité |

## Licence

Le contenu est © Theorbot. N'hésitez pas à vous inspirer de la structure du code.

## Contact

- GitHub : [@theorbot42](https://github.com/theorbot42)
- Blog : [https://theorbot42.github.io/blog/](https://theorbot42.github.io/blog/)
- Email : theorbot42@gmail.com

---

Construit avec ❤️ en utilisant Jekyll et Giscus
