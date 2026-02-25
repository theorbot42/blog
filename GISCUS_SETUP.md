# Configuration de Giscus pour le blog

Ce document explique comment configurer correctement Giscus pour ce blog.

## ✅ Ce qui est déjà fait

- ✅ Fichiers de configuration créés (`_config.yml`, `_includes/giscus_comments.html`)
- ✅ Layout mis à jour pour utiliser Giscus
- ✅ CSS personnalisé ajouté
- ✅ README mis à jour avec instructions

## 🔧 Configuration à compléter

Pour que les commentaires Giscus fonctionnent, vous devez :

### Étape 1 : Activer GitHub Discussions

1. Allez dans les paramètres du dépôt : 
   ```
   https://github.com/theorbot42/blog/settings
   ```

2. Faites défiler jusqu'à la section **Features**

3. Cochez la case **Discussions**

4. Cliquez sur **Set up discussions** si c'est la première fois

### Étape 2 : Créer une catégorie "General" (si nécessaire)

1. Allez dans l'onglet **Discussions** du dépôt

2. Si la catégorie "General" n'existe pas, créez-la :
   - Cliquez sur l'icône ⚙️ (paramètres)
   - Cliquez sur **New category**
   - Nom : `General`
   - Description : `Commentaires du blog`
   - Format de discussion : **Open-ended discussion**

### Étape 3 : Obtenir les identifiants Giscus

1. Rendez-vous sur **[https://giscus.app](https://giscus.app)**

2. Dans la section **Configuration**, entrez :
   - Repository : `theorbot42/blog`
   - ✅ Cochez : "The repository is public"

3. Vérifiez que le message suivant apparaît :
   ```
   ✅ Success! This repository meets all of the above criteria.
   ```

4. Dans **Page ↔️ Discussions Mapping**, choisissez :
   - ✅ **Discussion title contains page pathname**

5. Dans **Discussion Category**, choisissez :
   - ✅ **General**

6. Dans **Features**, configurez :
   - ✅ Enable reactions for the main post
   - Position du champ de saisie : **Bottom**

7. Dans **Theme**, choisissez :
   - ✅ **Preferred color scheme**

8. Faites défiler jusqu'à la section **Enable giscus**

9. Dans le code généré, trouvez ces valeurs :
   ```html
   data-repo="theorbot42/blog"
   data-repo-id="R_xxxxxxxxxxxx"
   data-category="General"
   data-category-id="DIC_xxxxxxxxxxxx"
   ```

### Étape 4 : Mettre à jour _config.yml

Ouvrez `_config.yml` et remplacez les valeurs des identifiants :

```yaml
giscus:
  repo: "theorbot42/blog"
  repo_id: "COPIEZ_ICI_LE_REPO_ID"          # Remplacez !
  category: "General"
  category_id: "COPIEZ_ICI_LE_CATEGORY_ID"  # Remplacez !
  mapping: "pathname"
  strict: "0"
  reactions_enabled: "1"
  emit_metadata: "0"
  input_position: "bottom"
  theme: "preferred_color_scheme"
  lang: "fr"
  loading: "lazy"
```

### Étape 5 : Tester

1. Commitez et poussez les modifications

2. Attendez que GitHub Pages déploie (1-2 minutes)

3. Visitez un article de votre blog : `https://theorbot42.github.io/blog/`

4. Faites défiler en bas de l'article

5. Vous devriez voir la section de commentaires Giscus ! 🎉

## 🔍 Vérification

Pour vérifier que tout fonctionne :

1. Les commentaires apparaissent sous les articles
2. Vous pouvez cliquer sur "Sign in with GitHub"
3. Après connexion, vous pouvez laisser un commentaire
4. Le commentaire apparaît aussi dans l'onglet Discussions du dépôt

## ❌ Problèmes courants

### Les commentaires ne s'affichent pas

**Causes possibles** :
- GitHub Discussions n'est pas activé → Vérifiez l'étape 1
- Les identifiants sont incorrects → Revérifiez sur giscus.app
- Le dépôt n'est pas public → Vérifiez dans Settings
- Vous testez en local → Giscus ne fonctionne qu'en production

### Message d'erreur "Repository not found"

- Vérifiez que `repo: "theorbot42/blog"` est correct
- Vérifiez que le dépôt est bien public

### Message d'erreur "Discussion category not found"

- Vérifiez que la catégorie "General" existe
- Vérifiez que le `category_id` est correct
- Obtenez un nouveau `category_id` depuis giscus.app

## 📚 Ressources

- Documentation Giscus : [https://github.com/giscus/giscus/blob/main/ADVANCED-USAGE.md](https://github.com/giscus/giscus/blob/main/ADVANCED-USAGE.md)
- Configuration : [https://giscus.app](https://giscus.app)
- Support : [https://github.com/giscus/giscus/discussions](https://github.com/giscus/giscus/discussions)

## 💡 Astuces

### Modérer les commentaires

Les commentaires Giscus apparaissent comme des discussions GitHub. Pour modérer :

1. Allez dans **Discussions** du dépôt
2. Trouvez la discussion correspondant à l'article
3. Vous pouvez :
   - Éditer les commentaires
   - Supprimer les commentaires inappropriés
   - Verrouiller une discussion
   - Épingler des discussions importantes

### Personnaliser l'apparence

Vous pouvez changer le thème dans `_config.yml` :

```yaml
theme: "light"           # Thème clair
theme: "dark"            # Thème sombre
theme: "dark_dimmed"     # Sombre atténué
theme: "transparent_dark" # Sombre transparent
theme: "preferred_color_scheme"  # Selon le système (recommandé)
```

### Notifications

Vous recevrez des notifications GitHub pour :
- Nouveaux commentaires sur vos articles
- Réponses aux discussions
- Réactions aux commentaires

Configurez vos préférences dans : **Settings → Notifications**

---

**Besoin d'aide ?** Ouvrez une issue sur le dépôt ou consultez la [documentation Giscus](https://github.com/giscus/giscus).
