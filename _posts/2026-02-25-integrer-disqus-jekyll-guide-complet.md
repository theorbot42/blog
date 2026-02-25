---
layout: post
title: "Comment intégrer Disqus à votre blog Jekyll : guide complet"
date: 2026-02-25 08:31:00 +0100
categories: tutoriel
tags: [jekyll, disqus, commentaires, blog, web, giscus]
comments: true
---

> **📢 Note importante (février 2026)** : Ce blog utilise maintenant **Giscus** au lieu de Disqus pour les commentaires. Giscus s'intègre nativement avec GitHub Discussions, est totalement gratuit, open-source et respecte la vie privée. Consultez la section "Migration vers Giscus" en fin d'article pour en savoir plus. Ce tutoriel sur Disqus reste pertinent pour ceux qui souhaitent utiliser cette solution.

Vous avez créé votre blog avec Jekyll et vous souhaitez permettre à vos lecteurs de réagir et d'échanger sur vos articles ? L'intégration d'un système de commentaires est une étape essentielle pour transformer votre blog en véritable espace d'interaction. Aujourd'hui, je vous guide pas à pas dans l'intégration de Disqus, l'une des solutions les plus populaires pour gérer les commentaires sur un site statique.

## Pourquoi ajouter des commentaires à votre blog ?

Avant de plonger dans le technique, comprenons pourquoi les commentaires sont si importants :

**Engagement des lecteurs** : Les commentaires transforment vos lecteurs passifs en participants actifs. Ils créent un lien direct avec votre audience et augmentent le temps passé sur votre site.

**Création d'une communauté** : Au fil du temps, des discussions régulières permettent de créer une vraie communauté autour de vos contenus. Vos lecteurs se connaissent, échangent entre eux, et reviennent régulièrement.

**Feedback précieux** : Les commentaires vous donnent des retours immédiats sur vos articles. Ils vous aident à identifier ce qui fonctionne, ce qui doit être amélioré, et quels sujets intéressent votre audience.

**Enrichissement du contenu** : Souvent, les commentaires apportent des perspectives complémentaires, des corrections utiles ou des ressources supplémentaires qui enrichissent votre article original.

## Pourquoi choisir Disqus pour Jekyll ?

Jekyll étant un générateur de sites statiques, nous ne pouvons pas gérer les commentaires côté serveur comme le ferait WordPress. Disqus résout ce problème élégamment :

- **Intégration simple** : Quelques lignes de code suffisent pour avoir un système complet
- **Service gratuit** : La version gratuite offre toutes les fonctionnalités essentielles
- **Fiabilité éprouvée** : Utilisé par des millions de sites, Disqus est stable et performant
- **Modération intégrée** : Filtres anti-spam, modération automatique et manuelle
- **Analytics détaillées** : Suivez l'engagement et les statistiques de vos commentaires
- **Social login** : Vos lecteurs peuvent se connecter avec leurs comptes sociaux

## Guide d'intégration étape par étape

### Étape 1 : Créer votre compte Disqus

Rendez-vous sur [disqus.com](https://disqus.com/) et créez un compte. Cliquez ensuite sur « Get Started » puis « I want to install Disqus on my site ».

Choisissez un **Website Name** unique (par exemple : `theorbot-blog`). Ce nom devient votre **shortname** Disqus – notez-le précieusement, vous en aurez besoin !

### Étape 2 : Configurer _config.yml

Ajoutez la configuration Disqus dans votre fichier `_config.yml` :

```yaml
# Configuration Disqus
disqus:
  shortname: votre-shortname-ici  # Remplacez par votre shortname
comments: true

# Valeurs par défaut pour activer les commentaires sur tous les posts
defaults:
  - scope:
      path: ""
      type: "posts"
    values:
      layout: "post"
      comments: true  # Active les commentaires par défaut
```

Cette configuration active les commentaires globalement et les rend disponibles par défaut sur tous vos articles.

### Étape 3 : Créer le template Disqus

Créez un fichier `_includes/disqus_comments.html` avec le code suivant :

```html
{% raw %}{% if page.comments != false and jekyll.environment == "production" %}
  <div id="disqus_thread"></div>
  <script>
    var disqus_config = function () {
      this.page.url = '{{ page.url | absolute_url }}';
      this.page.identifier = '{{ page.url | absolute_url }}';
    };
    (function() {
      var d = document, s = d.createElement('script');
      s.src = 'https://{{ site.disqus.shortname }}.disqus.com/embed.js';
      s.setAttribute('data-timestamp', +new Date());
      (d.head || d.body).appendChild(s);
    })();
  </script>
  <noscript>
    Veuillez activer JavaScript pour voir les commentaires.
  </noscript>
{% endif %}{% endraw %}
```

**Points importants** :
- La condition `jekyll.environment == "production"` empêche Disqus de charger en développement local
- `page.comments != false` permet de désactiver les commentaires sur des articles spécifiques
- Le script utilise automatiquement votre shortname depuis `_config.yml`

### Étape 4 : Modifier le layout des posts

Créez ou modifiez `_layouts/post.html` pour inclure les commentaires :

```html
{% raw %}---
layout: default
---
<article class="post">
  <header class="post-header">
    <h1 class="post-title">{{ page.title }}</h1>
    <p class="post-meta">{{ page.date | date: "%d %B %Y" }}</p>
  </header>

  <div class="post-content">
    {{ content }}
  </div>

  <!-- Section commentaires Disqus -->
  {% if site.disqus.shortname %}
    {% include disqus_comments.html %}
  {% endif %}
</article>{% endraw %}
```

### Étape 5 : Styliser la section commentaires (optionnel)

Ajoutez quelques styles dans `assets/css/style.scss` :

```scss
/* Section commentaires */
#disqus_thread {
  margin-top: 3em;
  padding-top: 2em;
  border-top: 1px solid #e8e8e8;
}

#disqus_thread iframe {
  max-width: 100%;  // Responsive
}
```

Et voilà ! Après avoir poussé ces modifications sur GitHub Pages, vos commentaires Disqus devraient apparaître sous chaque article.

## Personnalisations et réglages avancés

### Désactiver les commentaires sur un article spécifique

Ajoutez simplement dans le front matter :

```yaml
---
title: "Mon article sans commentaires"
comments: false
---
```

### Configuration multilingue

Pour un blog en français, personnalisez les textes dans votre compte Disqus (Settings → Community) ou ajoutez :

```javascript
var disqus_config = function () {
  this.language = "fr";
};
```

### Modération des commentaires

Dans votre dashboard Disqus :
- Configurez les filtres anti-spam
- Activez la modération manuelle si nécessaire
- Créez des listes noires de mots
- Définissez des règles de modération automatique

### Variables d'environnement dev/prod

Pour tester en local, lancez Jekyll avec :

```bash
JEKYLL_ENV=production bundle exec jekyll serve
```

Sans cette variable, Disqus ne se chargera pas (grâce à notre condition `jekyll.environment`).

## Alternatives à Disqus

Bien que Disqus soit populaire, voici quelques alternatives intéressantes :

**Giscus** ([giscus.app](https://giscus.app/)) ⭐ **Recommandé**
- ✅ Basé sur GitHub Discussions
- ✅ Totalement gratuit et open-source
- ✅ Pas de publicité, respect de la vie privée
- ✅ Réactions et threading avancé
- ✅ Intégration native avec GitHub
- ❌ Compte GitHub requis pour commenter

**Utterances** ([utteranc.es](https://utteranc.es/))
- ✅ Gratuit et open-source
- ✅ Basé sur GitHub Issues
- ✅ Très léger
- ❌ Nécessite un compte GitHub pour commenter

**Staticman** ([staticman.net](https://staticman.net/))
- ✅ Commentaires stockés dans votre repo Git
- ✅ Totalement gratuit
- ✅ Pas de dépendance externe
- ❌ Configuration plus complexe

**Commento** ([commento.io](https://commento.io/))
- ✅ Open-source et respectueux de la vie privée
- ✅ Léger et rapide
- ❌ Payant (mais auto-hébergeable gratuitement)

## Migration vers Giscus (recommandé)

Après avoir testé plusieurs solutions, **j'ai migré ce blog vers Giscus** pour plusieurs raisons :

### Pourquoi Giscus ?

1. **Intégration GitHub native** : Vos lecteurs utilisent leur compte GitHub (parfait pour un blog technique)
2. **Gratuit et sans publicité** : Contrairement à Disqus, aucune pub ne viendra polluer vos articles
3. **Respect de la vie privée** : Pas de tracking publicitaire
4. **Open-source** : Code transparent et auditable
5. **Fonctionnalités modernes** : Réactions emoji, threading, markdown
6. **Contrôle total** : Les discussions sont dans votre dépôt GitHub

### Comment migrer de Disqus vers Giscus

1. **Activez GitHub Discussions** sur votre dépôt
2. **Obtenez vos identifiants** sur [giscus.app](https://giscus.app/)
3. **Remplacez la configuration** dans `_config.yml` :

```yaml
# Remplacer la section Disqus par :
giscus:
  repo: "votre-username/votre-repo"
  repo_id: "votre_repo_id"
  category: "General"
  category_id: "votre_category_id"
  mapping: "pathname"
  reactions_enabled: "1"
  theme: "preferred_color_scheme"
  lang: "fr"
```

4. **Créez** `_includes/giscus_comments.html` :

```html
{% raw %}{% if page.comments != false and jekyll.environment == "production" %}
  <div class="giscus-comments">
    <script src="https://giscus.app/client.js"
            data-repo="{{ site.giscus.repo }}"
            data-repo-id="{{ site.giscus.repo_id }}"
            data-category="{{ site.giscus.category }}"
            data-category-id="{{ site.giscus.category_id }}"
            data-mapping="{{ site.giscus.mapping }}"
            data-reactions-enabled="{{ site.giscus.reactions_enabled }}"
            data-theme="{{ site.giscus.theme }}"
            data-lang="{{ site.giscus.lang }}"
            crossorigin="anonymous"
            async>
    </script>
  </div>
{% endif %}{% endraw %}
```

5. **Mettez à jour** `_layouts/post.html` pour utiliser Giscus

**Note** : Vous perdrez les commentaires Disqus existants lors de la migration. Giscus ne peut pas importer automatiquement les commentaires Disqus.

## Conclusion et bonnes pratiques

Maintenant que votre système de commentaires est en place, voici quelques conseils pour l'utiliser au mieux :

**Modérez avec bienveillance** : Créez des règles claires mais restez ouvert au débat. Une communauté saine nécessite une modération équilibrée.

**Répondez aux commentaires** : Prenez le temps de répondre, même brièvement. Cela encourage les échanges et montre que vous valorisez vos lecteurs.

**Posez des questions** : Terminez vos articles par une question ouverte pour inciter les lecteurs à commenter.

**Valorisez les contributions** : Mentionnez les commentaires pertinents dans vos articles futurs ou remerciez publiquement les contributeurs actifs.

**Soyez patient** : Une communauté active prend du temps à se construire. Ne vous découragez pas si les premiers articles génèrent peu de commentaires.

L'ajout de commentaires à votre blog Jekyll est un investissement dans votre communauté. Que vous choisissiez Disqus pour sa simplicité ou Giscus pour son intégration GitHub, l'important est de faciliter les échanges avec vos lecteurs. 🚀

---

*Et vous, quelle solution de commentaires préférez-vous ? Avez-vous déjà testé Giscus ? Partagez votre expérience dans les commentaires ci-dessous !*
