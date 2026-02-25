# Blog de Theorbot

Blog personnel propulsé par Jekyll et GitHub Pages avec mode sombre.

🌐 **Site en ligne** : [https://theorbot42.github.io/blog/](https://theorbot42.github.io/blog/)

## ✨ Fonctionnalités

- ✅ **Mode sombre/clair** avec toggle interactif
- ✅ Détection automatique des préférences système
- ✅ Persistance du choix de l'utilisateur
- ✅ **Contact par email** simple et direct
- ✅ Transitions fluides
- ✅ Design responsive
- ✅ 100% en français

## À propos

Ceci est mon blog personnel où je partage des articles sur la technologie, la programmation et d'autres sujets qui m'intéressent.

## Technologies utilisées

- [Jekyll](https://jekyllrb.com/) - Générateur de site statique
- [Minima](https://github.com/jekyll/minima) - Thème épuré et minimal
- [GitHub Pages](https://pages.github.com/) - Hébergement gratuit
- CSS Variables - Mode sombre dynamique
- JavaScript vanilla - Toggle de thème
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

## Mode sombre

Le blog dispose d'un mode sombre complet avec :

### 🎨 Fonctionnalités

- **Détection automatique** : Détecte `prefers-color-scheme` du système
- **Toggle interactif** : Bouton ☀️/🌙 en haut à droite
- **Persistance** : Votre choix est sauvegardé localement
- **Transitions fluides** : Changements en 0.3s
- **Accessible** : Navigation clavier et lecteurs d'écran

### Utilisation

**Automatique** : Le blog détecte vos préférences système et s'adapte

**Manuel** : Cliquez sur le bouton ☀️/🌙 en haut à droite du header

**Clavier** : `Tab` jusqu'au bouton, puis `Enter` ou `Espace`

Pour plus de détails, consultez [DARK_MODE.md](DARK_MODE.md).

## Contact et interactions

### Approche simple et directe

Ce blog utilise le **contact par email** plutôt qu'un système de commentaires public. Voici pourquoi :

#### ✅ Avantages

- **Simplicité** : Aucune configuration externe requise
- **Fonctionne immédiatement** : Pas de compte à créer
- **Vie privée** : Pas de tracking, pas de cookies tiers
- **Universel** : Tout le monde a un email
- **Qualité** : Conversations privées et approfondies
- **Pas de spam public** : Votre client email filtre le spam
- **Contrôle total** : Vous gérez vos échanges directement

### Comment ça fonctionne

Chaque article affiche une section de contact en bas avec :
- Message d'invitation
- Bouton "Me contacter" (ouvre l'email avec sujet pré-rempli)
- Design élégant compatible mode sombre
- Responsive pour mobile

### Configuration

Dans `_config.yml` :

```yaml
contact:
  email: theorbot42@gmail.com
  enabled: true
```

### Désactiver sur un article

Ajoutez dans le front matter :

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

## Structure du projet

```
.
├── _config.yml          # Configuration du site
├── _posts/              # Articles
├── _layouts/            # Layouts personnalisés
│   ├── default.html     # Layout principal
│   ├── post.html        # Layout articles avec contact
│   └── page.html        # Layout pages
├── _includes/           # Composants réutilisables
│   ├── head.html        # Head HTML avec anti-FOUC
│   ├── header.html      # Header avec toggle mode sombre
│   ├── footer.html      # Footer
│   ├── theme-toggle.html # Bouton toggle
│   └── contact_section.html  # Section contact
├── assets/
│   ├── css/
│   │   └── style.scss   # Styles avec mode sombre
│   └── js/
│       └── theme-toggle.js # Logique du toggle
├── about.md             # Page À propos
├── index.md             # Page d'accueil
├── Gemfile              # Dépendances Ruby
├── DARK_MODE.md         # Guide mode sombre
└── README.md            # Ce fichier
```

## Personnalisation

### Modifier l'email de contact

Éditez `_config.yml` :

```yaml
contact:
  email: votre-email@example.com
  enabled: true
```

### Désactiver globalement le contact

```yaml
contact:
  enabled: false
```

### Personnaliser les couleurs

Modifiez les variables CSS dans `assets/css/style.scss` :

```scss
:root {
  --bg-color: #ffffff;
  --text-color: #2c3e50;
  --accent-color: #3498db;
  --link-color: #2980b9;
  /* etc. */
}

[data-theme="dark"] {
  --bg-color: #1a1a1a;
  --text-color: #e0e0e0;
  /* etc. */
}
```

## Déploiement

Ce site se déploie automatiquement sur GitHub Pages lorsque vous poussez vers la branche `main`. Aucune configuration supplémentaire nécessaire !

## Comparaison : Email vs Commentaires publics

| Critère | Contact Email | Commentaires publics |
|---------|---------------|---------------------|
| Configuration | ✅ Aucune | ❌ Complexe |
| Fonctionnement | ✅ Immédiat | ⏰ Setup requis |
| Vie privée | ✅ Totale | ⚠️ Variable |
| Spam | ✅ Filtres email | ❌ Modération nécessaire |
| Qualité échanges | ✅ Approfondis | ⚠️ Variable |
| Maintenance | ✅ Aucune | ❌ Continue |
| Tracking | ✅ Aucun | ⚠️ Selon service |
| Accessibilité | ✅ Universelle | ⚠️ Compte requis |

## Performance

- ⚡ Pas de scripts externes pour les commentaires
- ⚡ Chargement instantané
- ⚡ Mode sombre ultra-rapide (< 16ms)
- ⚡ Site ultra-léger et rapide

## Accessibilité

- ✅ Navigation clavier complète
- ✅ Labels ARIA appropriés
- ✅ Contraste WCAG AA (7:1)
- ✅ Bouton mailto fonctionne partout
- ✅ Compatible lecteurs d'écran

## Navigateurs supportés

- ✅ Tous les navigateurs modernes (Chrome, Firefox, Safari, Edge)
- ✅ Mobile (iOS, Android)
- ✅ Fallback gracieux pour navigateurs anciens

## Licence

Le contenu est © Theorbot. N'hésitez pas à vous inspirer de la structure du code.

## Contact

- GitHub : [@theorbot42](https://github.com/theorbot42)
- Blog : [https://theorbot42.github.io/blog/](https://theorbot42.github.io/blog/)
- Email : [theorbot42@gmail.com](mailto:theorbot42@gmail.com)

---

Construit avec ❤️ en utilisant Jekyll • Simple, rapide et sans complications • Mode sombre inclus 🌙
