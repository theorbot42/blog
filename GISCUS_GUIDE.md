# Guide de configuration Giscus

Ce blog utilise maintenant Giscus pour les commentaires ! Voici tout ce que vous devez savoir.

## ✅ Configuration actuelle

Le blog est **déjà configuré** avec les bons identifiants :

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

## 📋 Checklist pour que tout fonctionne

### ✅ Étape 1 : Installer l'application Giscus

1. Allez sur : **[https://github.com/apps/giscus](https://github.com/apps/giscus)**
2. Cliquez sur **Install**
3. Sélectionnez **Only select repositories**
4. Cochez `theorbot42/blog`
5. Cliquez sur **Install**

### ✅ Étape 2 : Activer GitHub Discussions

1. Allez dans **Settings** du dépôt : [https://github.com/theorbot42/blog/settings](https://github.com/theorbot42/blog/settings)
2. Sous la section **Features**, cochez **Discussions**
3. Cliquez sur **Set up discussions** si nécessaire

### ✅ Étape 3 : Vérifier la catégorie "Announcements"

1. Allez dans l'onglet **Discussions** : [https://github.com/theorbot42/blog/discussions](https://github.com/theorbot42/blog/discussions)
2. Vérifiez qu'une catégorie nommée **"Announcements"** existe
3. Si elle n'existe pas :
   - Cliquez sur l'icône ⚙️ (paramètres)
   - Créez une nouvelle catégorie "Announcements"
   - Type : **Announcement** (annonces)

## 🔍 Comment vérifier que tout fonctionne

1. Visitez votre blog : [https://theorbot42.github.io/blog/](https://theorbot42.github.io/blog/)
2. Ouvrez un article
3. Faites défiler jusqu'en bas
4. Vous devriez voir la section de commentaires Giscus
5. Cliquez sur "Sign in with GitHub" pour tester

## 📝 Script utilisé

Voici exactement le script qui est chargé sur chaque article :

```html
<script src="https://giscus.app/client.js"
        data-repo="theorbot42/blog"
        data-repo-id="R_kgDORYW9pg"
        data-category="Announcements"
        data-category-id="DIC_kwDORYW9ps4Cf3aS"
        data-mapping="pathname"
        data-strict="0"
        data-reactions-enabled="1"
        data-emit-metadata="0"
        data-input-position="bottom"
        data-theme="preferred_color_scheme"
        data-lang="fr"
        crossorigin="anonymous"
        async>
</script>
```

## 🎨 Personnalisation

### Changer le thème

Éditez `_config.yml` et changez :

```yaml
theme: "light"           # Thème clair
theme: "dark"            # Thème sombre
theme: "dark_dimmed"     # Sombre atténué
theme: "transparent_dark" # Sombre transparent
theme: "preferred_color_scheme"  # Auto (recommandé)
```

### Désactiver les réactions

```yaml
reactions_enabled: "0"  # Désactive les emojis
```

### Changer la position du champ de saisie

```yaml
input_position: "top"    # En haut
input_position: "bottom" # En bas (actuel)
```

## 🔧 Fonctionnement

- Chaque article crée automatiquement une discussion dans la catégorie "Announcements"
- Le titre de la discussion = chemin de l'article (pathname)
- Les commentaires apparaissent à la fois sur le blog et dans les Discussions GitHub
- Les lecteurs doivent avoir un compte GitHub pour commenter

## 💡 Avantages

- ✅ **Gratuit à 100%** : Pas de frais cachés
- ✅ **Open-source** : Code transparent
- ✅ **Pas de pub** : Zéro publicité
- ✅ **Vie privée** : Pas de tracking
- ✅ **Modération native** : Via GitHub
- ✅ **Notifications** : Intégrées à GitHub
- ✅ **Markdown** : Support complet
- ✅ **Réactions** : Emojis GitHub

## 🐛 Problèmes courants

### Les commentaires ne s'affichent pas

**Cause 1** : Application Giscus non installée
→ Solution : Installez l'app sur [https://github.com/apps/giscus](https://github.com/apps/giscus)

**Cause 2** : Discussions non activées
→ Solution : Activez dans Settings → Features → Discussions

**Cause 3** : Catégorie "Announcements" n'existe pas
→ Solution : Créez-la dans l'onglet Discussions

**Cause 4** : Vous testez en local
→ Solution : Giscus fonctionne uniquement en production (sur GitHub Pages)

**Cause 5** : Le dépôt n'est pas public
→ Solution : Rendez le dépôt public dans Settings

### Message d'erreur "Repository not found"

Vérifiez que :
- Le dépôt `theorbot42/blog` est bien public
- L'application Giscus est installée sur ce dépôt

### Message d'erreur "Discussion category not found"

Vérifiez que :
- La catégorie "Announcements" existe dans Discussions
- Le `category_id` est correct : `DIC_kwDORYW9ps4Cf3aS`

## 📚 Ressources

- Configuration : [https://giscus.app](https://giscus.app)
- Documentation : [https://github.com/giscus/giscus](https://github.com/giscus/giscus)
- Support : [https://github.com/giscus/giscus/discussions](https://github.com/giscus/giscus/discussions)

## 🎯 Pour aller plus loin

### Modérer les commentaires

1. Allez dans **Discussions** du dépôt
2. Trouvez la discussion de l'article
3. Actions possibles :
   - ✏️ Éditer un commentaire
   - 🗑️ Supprimer un commentaire inapproprié
   - 🔒 Verrouiller une discussion
   - 📌 Épingler une discussion importante

### Personnaliser les messages

Les textes de Giscus sont en français automatiquement grâce à `data-lang="fr"`.

### Recevoir des notifications

Vous recevrez des notifications GitHub pour :
- Nouveaux commentaires sur vos articles
- Réponses aux discussions
- Réactions aux commentaires

Configurez vos préférences dans : **GitHub Settings → Notifications**

---

**Tout est prêt !** 🎉 Les commentaires Giscus devraient maintenant fonctionner sur votre blog.
