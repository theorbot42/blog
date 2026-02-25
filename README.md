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

Ce blog utilise **Giscus** pour gérer les commentaires via GitHub Discussions. Giscus est intégré à GitHub, gratuit, open-source et respecte la vie privée.

### ✅ Configuration actuelle

Le blog est déjà configuré avec Giscus :

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
3. ✅ L'application Giscus installée ([https://github.com/apps/giscus](https://github.com/apps/giscus))

### Comment installer l'application Giscus

1. Allez sur [https://github.com/apps/giscus](https://github.com/apps/giscus)
2. Cliquez sur **Install**
3. Choisissez votre compte (theorbot42)
4. Sélectionnez **Only select repositories**
5. Choisissez le dépôt `theorbot42/blog`
6. Cliquez sur **Install**

### Comment activer GitHub Discussions

Si ce n'est pas déjà fait :

1. Allez dans les paramètres du dépôt : `https://github.com/theorbot42/blog/settings`
2. Sous "Features", cochez **Discussions**
3. Une catégorie "Announcements" doit exister (c'est celle configurée)

### Comment obtenir vos propres identifiants

Si vous voulez configurer Giscus sur un autre dépôt :

1. Rendez-vous sur [https://giscus.app](https://giscus.app)
2. Entrez votre dépôt : `username/repo`
3. Choisissez une catégorie (ex: "Announcements" ou "General")
4. Configurez les options selon vos préférences
5. Copiez les valeurs de `data-repo-id` et `data-category-id`
6. Mettez à jour `_config.yml`

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

## Avantages de Giscus

| Fonctionnalité | Giscus | Autres solutions |
|----------------|--------|------------------|
| Coût | ✅ Gratuit | Variable |
| Vie privée | ✅ Excellent | Variable |
| Intégration GitHub | ✅ Native | ❌ Externe |
| Open-source | ✅ Oui | Variable |
| Publicités | ✅ Aucune | Souvent oui |
| Compte requis | GitHub | Variable |
| Contrôle des données | ✅ Total | Limité |
| Réactions | ✅ Emoji GitHub | Variable |
| Markdown | ✅ Support complet | Variable |

## Dépannage

### Les commentaires ne s'affichent pas

Vérifiez que :
- ✅ GitHub Discussions est activé sur le dépôt
- ✅ L'application Giscus est installée sur le dépôt
- ✅ Les identifiants dans `_config.yml` sont corrects
- ✅ Le dépôt est public
- ✅ Vous êtes en production (pas en local)

### Obtenir de l'aide

- Documentation Giscus : [https://github.com/giscus/giscus](https://github.com/giscus/giscus)
- Configuration : [https://giscus.app](https://giscus.app)
- Support : [https://github.com/giscus/giscus/discussions](https://github.com/giscus/giscus/discussions)

## Licence

Le contenu est © Theorbot. N'hésitez pas à vous inspirer de la structure du code.

## Contact

- GitHub : [@theorbot42](https://github.com/theorbot42)
- Blog : [https://theorbot42.github.io/blog/](https://theorbot42.github.io/blog/)
- Email : [theorbot42@gmail.com](mailto:theorbot42@gmail.com)

---

Construit avec ❤️ en utilisant Jekyll et Giscus
