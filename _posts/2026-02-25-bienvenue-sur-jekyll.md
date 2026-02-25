---
layout: post
title: "Bienvenue sur Jekyll !"
date: 2026-02-25 08:00:00 +0100
categories: jekyll mise-a-jour
tags: [jekyll, tutoriel, démarrage]
---

Bienvenue sur mon nouveau blog Jekyll ! Ceci est mon premier article de blog, démontrant à quel point il est facile d'écrire du contenu en Markdown.

## Débuter avec Jekyll

Jekyll est un générateur de site statique simple, conçu pour les blogs, parfait pour les sites personnels, de projets ou d'organisations. Il prend du texte écrit dans votre langage de balisage favori et utilise des modèles pour créer un site web statique.

### Pourquoi Jekyll ?

- **Simple** : Pas de base de données, juste des fichiers et des dossiers
- **Rapide** : Les sites statiques sont incroyablement rapides
- **Flexible** : Utilisez Markdown, les templates Liquid et plus encore
- **Hébergement gratuit** : GitHub Pages héberge les sites Jekyll gratuitement

### Écrire des articles

Pour ajouter de nouveaux articles, créez simplement un fichier dans le répertoire `_posts` avec le format suivant :

```
AAAA-MM-JJ-titre-de-l-article.md
```

Par exemple :
- `2026-02-25-mon-premier-article.md`
- `2026-03-01-un-autre-super-article.md`

### Front Matter

Chaque article commence par du front matter YAML :

```yaml
---
layout: post
title: "Titre de votre article"
date: 2026-02-25 08:00:00 +0100
categories: nom-categorie
tags: [tag1, tag2, tag3]
---
```

## Les bases du Markdown

Voici quelques exemples de formatage Markdown :

### Listes

Liste non ordonnée :
- Premier élément
- Deuxième élément
- Troisième élément

Liste ordonnée :
1. Premier élément
2. Deuxième élément
3. Troisième élément

### Blocs de code

Code en ligne : `var exemple = true`

Bloc de code :
```javascript
function saluer(nom) {
  console.log(`Bonjour, ${nom} !`);
}

saluer('Monde');
```

### Liens et images

[Documentation Jekyll](https://jekyllrb.com/docs/)

### Citations

> « La simplicité est la sophistication suprême. »
> — Léonard de Vinci

## Et maintenant ?

Maintenant que votre blog est configuré, vous pouvez :

1. Personnaliser `_config.yml` avec vos informations personnelles
2. Créer de nouveaux articles dans le répertoire `_posts`
3. Modifier les layouts et includes pour changer le design
4. Ajouter du CSS personnalisé dans `assets/css/`
5. Explorer les plugins et thèmes Jekyll

Bon blogging ! 🚀

---

*Consultez la [documentation Jekyll](https://jekyllrb.com/docs/) pour plus d'informations sur comment tirer le meilleur parti de Jekyll.*