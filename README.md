# Blog de Theorbot

Blog personnel propulsé par Jekyll et GitHub Pages.

🌐 **Site en ligne** : [https://theorbot42.github.io/blog/](https://theorbot42.github.io/blog/)

## À propos

Ceci est mon blog personnel où je partage des articles sur la technologie, la programmation et d'autres sujets qui m'intéressent.

## Technologies utilisées

- [Jekyll](https://jekyllrb.com/) - Générateur de site statique
- [Minima](https://github.com/jekyll/minima) - Thème épuré et minimal
- [GitHub Pages](https://pages.github.com/) - Hébergement gratuit
- [Disqus](https://disqus.com/) - Système de commentaires

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
comments: true  # Active les commentaires Disqus (activé par défaut)
---
```

4. Rédigez votre contenu en Markdown sous le front matter
5. Commitez et poussez vers GitHub
6. Votre article sera en ligne en quelques minutes !

## Configuration des commentaires Disqus

Ce blog utilise Disqus pour gérer les commentaires. Pour configurer Disqus :

### Étape 1 : Créer un compte Disqus

1. Allez sur [https://disqus.com/](https://disqus.com/)
2. Cliquez sur "Get Started"
3. Sélectionnez "I want to install Disqus on my site"
4. Créez votre site Disqus

### Étape 2 : Obtenir votre shortname

1. Lors de la création, choisissez un **Website Name** unique (par exemple : `theorbot-blog`)
2. Ce nom devient votre **shortname** Disqus
3. Notez ce shortname

### Étape 3 : Configurer le blog

1. Ouvrez `_config.yml`
2. Modifiez la section Disqus :

```yaml
disqus:
  shortname: votre-shortname-ici  # Remplacez par votre shortname
comments: true
```

3. Sauvegardez et poussez les modifications

### Désactiver les commentaires

Pour désactiver les commentaires sur un article spécifique, ajoutez dans le front matter :

```yaml
comments: false
```

Pour désactiver tous les commentaires sur le blog, modifiez `_config.yml` :

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

**Note** : Les commentaires Disqus ne s'affichent qu'en production (sur GitHub Pages), pas en développement local.

## Structure du projet

```
.
├── _config.yml          # Configuration du site
├── _posts/              # Les articles vont ici
├── _layouts/            # Layouts personnalisés
│   └── post.html        # Layout pour les articles (avec Disqus)
├── _includes/           # Composants réutilisables
│   └── disqus_comments.html  # Code d'intégration Disqus
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
- La configuration Disqus

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

Construit avec ❤️ en utilisant Jekyll