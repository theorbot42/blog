# Blog de Theorbot

Blog personnel propulsé par Jekyll et GitHub Pages.

🌐 **Site en ligne** : [https://theorbot42.github.io/blog/](https://theorbot42.github.io/blog/)

## À propos

Ceci est mon blog personnel où je partage des articles sur la technologie, la programmation et d'autres sujets qui m'intéressent.

## Technologies utilisées

- [Jekyll](https://jekyllrb.com/) - Générateur de site statique
- [Minima](https://github.com/jekyll/minima) - Thème épuré et minimal
- [GitHub Pages](https://pages.github.com/) - Hébergement gratuit
- Contact par email - Simple et efficace

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
comments: true  # Active la section contact (activé par défaut)
---
```

4. Rédigez votre contenu en Markdown sous le front matter
5. Commitez et poussez vers GitHub
6. Votre article sera en ligne en quelques minutes !

## Section de contact

Ce blog utilise une approche simple et directe pour les interactions : **le contact par email**. 

### Pourquoi cette approche ?

- ✅ **Fonctionne immédiatement** : Aucune configuration externe requise
- ✅ **Simplicité** : Pas de compte à créer pour vos lecteurs
- ✅ **Vie privée** : Pas de tracking, pas de cookies tiers
- ✅ **Contrôle total** : Vous gérez vos échanges directement
- ✅ **Universel** : Tout le monde a un email
- ✅ **Personnel** : Conversations privées et de qualité

### Comment ça fonctionne ?

Chaque article affiche une section de contact en bas avec :
- Un message d'invitation personnalisé
- Un bouton "Écrivez-moi" qui ouvre le client email
- Le sujet pré-rempli avec le titre de l'article
- Votre adresse email pour contact direct

### Configuration

La section de contact est configurée dans `_config.yml` :

```yaml
contact:
  email: theorbot42@gmail.com
  message: "Une question ? Un commentaire sur cet article ? N'hésitez pas à me contacter !"
  cta: "Écrivez-moi"
comments: true
```

### Personnalisation

**Modifier le message** : Éditez `contact.message` dans `_config.yml`

**Modifier le bouton** : Changez `contact.cta` dans `_config.yml`

**Désactiver sur un article** : Ajoutez `comments: false` dans le front matter

**Désactiver globalement** : Mettez `comments: false` dans `_config.yml`

## Développement local

Pour exécuter ce blog en local :

```bash
# Installer les dépendances
bundle install

# Lancer le serveur local
bundle exec jekyll serve

# Visitez http://localhost:4000/blog/
```

## Structure du projet

```
.
├── _config.yml          # Configuration du site
├── _posts/              # Les articles vont ici
├── _layouts/            # Layouts personnalisés
│   └── post.html        # Layout pour les articles (avec section contact)
├── _includes/           # Composants réutilisables
│   └── contact_section.html  # Section de contact
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
- La configuration de contact

### Thème

Ce blog utilise le thème [Minima](https://github.com/jekyll/minima). Vous pouvez :
- Personnaliser les couleurs et les styles
- Remplacer les layouts en créant des fichiers dans `_layouts/`
- Remplacer les includes en créant des fichiers dans `_includes/`
- Ajouter du CSS personnalisé dans `assets/css/`

### Personnaliser la section contact

Le design de la section contact peut être modifié dans `assets/css/style.scss`. Actuellement, elle présente :

- 🎨 Un design moderne avec dégradé
- 💫 Des animations au survol
- 📱 Un design responsive
- 🌓 Support du mode sombre
- ✨ Des effets visuels élégants

## Avantages du contact par email

| Fonctionnalité | Email | Commentaires publics |
|----------------|-------|---------------------|
| Configuration | ✅ Aucune | ❌ Complexe |
| Vie privée | ✅ Excellente | ⚠️ Variable |
| Spam | ✅ Filtres email | ⚠️ Modération requise |
| Qualité échanges | ✅ Conversations détaillées | ⚠️ Souvent courts |
| Maintenance | ✅ Aucune | ❌ Modération continue |
| Coût | ✅ Gratuit | ⚠️ Variable |

## Gestion des contacts

### Organisez vos emails

Pour gérer efficacement les emails de vos lecteurs :

1. **Créez des filtres** dans votre client email
   - Filtrez par sujet (titre de l'article)
   - Créez des labels/dossiers par catégorie

2. **Templates de réponse** : Préparez des réponses types pour les questions fréquentes

3. **Temps de réponse** : Indiquez dans la section contact votre délai de réponse habituel

### Éviter le spam

- ✅ Utilisez un email dédié pour le blog
- ✅ Activez les filtres anti-spam de votre fournisseur
- ✅ Ne publiez jamais votre email en texte brut dans le HTML (utiliser `mailto:`)

## Déploiement

Ce site se déploie automatiquement sur GitHub Pages lorsque vous poussez vers la branche `main`. Aucune configuration supplémentaire nécessaire !

## Alternatives pour les commentaires

Si vous souhaitez ajouter des commentaires publics plus tard, plusieurs options existent :

- **Giscus** : Basé sur GitHub Discussions (pour audience technique)
- **Utterances** : Basé sur GitHub Issues (simple et léger)
- **Disqus** : Service externe populaire (avec publicités)
- **Staticman** : Commentaires dans Git (configuration avancée)

Pour ce blog, j'ai choisi la simplicité du contact direct par email. C'est plus personnel et évite les problèmes de modération et de spam.

## Licence

Le contenu est © Theorbot. N'hésitez pas à vous inspirer de la structure du code.

## Contact

- GitHub : [@theorbot42](https://github.com/theorbot42)
- Blog : [https://theorbot42.github.io/blog/](https://theorbot42.github.io/blog/)
- Email : [theorbot42@gmail.com](mailto:theorbot42@gmail.com)

---

Construit avec ❤️ en utilisant Jekyll • Simple, rapide et sans complications
