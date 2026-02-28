# 🛠️ Scripts Utiles

Ce dossier contient des scripts shell pour faciliter la gestion du blog.

## 📜 Scripts disponibles

### 1. new-article.sh

**Créer un nouvel article rapidement**

```bash
./scripts/new-article.sh [slug] [titre-complet]
```

**Exemples :**
```bash
# Article simple
./scripts/new-article.sh reflexion-temps "Réflexion sur le Temps"

# Article avec slug seulement (titre = slug)
./scripts/new-article.sh ma-reflexion
```

**Ce que fait ce script :**
- ✅ Crée un fichier dans `_posts/` avec la date du jour
- ✅ Génère le front matter automatiquement
- ✅ Insère le template d'article
- ✅ Affiche les prochaines étapes

### 2. preview.sh

**Prévisualiser le blog localement**

```bash
./scripts/preview.sh [options]
```

**Options :**
- `-c, --clean` : Nettoyer le cache avant de démarrer
- `-d, --drafts` : Afficher les brouillons
- `-f, --future` : Afficher les articles futurs
- `-p, --port` : Port personnalisé (défaut: 4000)
- `-h, --help` : Afficher l'aide

**Exemples :**
```bash
# Démarrage normal
./scripts/preview.sh

# Avec nettoyage du cache
./scripts/preview.sh -c

# Avec brouillons et articles futurs
./scripts/preview.sh -d -f

# Port personnalisé
./scripts/preview.sh -p 4001

# Combinaison
./scripts/preview.sh -c -d -p 4002
```

**Ce que fait ce script :**
- ✅ Vérifie les dépendances (bundle)
- ✅ Installe les gems si nécessaire
- ✅ Lance Jekyll avec livereload
- ✅ Affiche l'URL locale
- ✅ Recharge automatiquement les modifications

### 3. validate.sh

**Valider la qualité du contenu**

```bash
./scripts/validate.sh
```

**Ce que vérifie ce script :**

**Structure**
- ✅ Présence de `_config.yml`
- ✅ Présence du dossier `_posts/`
- ✅ Structure correcte des fichiers

**Articles**
- ✅ Noms de fichiers corrects (`YYYY-MM-DD-titre.md`)
- ✅ Front matter présent et complet
- ✅ Champs obligatoires (title, date, layout)
- ✅ Longueur minimale (> 300 mots)

**Configuration**
- ✅ Titre du site défini
- ✅ URL configurée
- ✅ Plugins correctement chargés

**Build**
- ✅ Jekyll compile sans erreur
- ✅ Pas d'erreurs de syntaxe

**Images**
- ✅ Taille des images (< 500KB recommandé)
- ✅ Format et organisation

**Résultat :**
- 🟢 `exit 0` : Aucun problème
- 🟡 `exit 0` : Avertissements seulement
- 🔴 `exit 1` : Erreurs à corriger

---

## 🚀 Workflow recommandé

### Créer et publier un nouvel article

```bash
# 1. Créer une branche feature
git checkout develop
git checkout -b feature/mon-article

# 2. Créer l'article
./scripts/new-article.sh mon-article "Mon Titre Complet"

# 3. Rédiger l'article
# Éditer _posts/YYYY-MM-DD-mon-article.md

# 4. Prévisualiser localement
./scripts/preview.sh

# 5. Valider avant commit
./scripts/validate.sh

# 6. Commit et push
git add _posts/YYYY-MM-DD-mon-article.md
git commit -m "feat: Add reflection on [sujet]"
git push origin feature/mon-article

# 7. Créer une PR sur GitHub
```

### Développement local

```bash
# Démarrage rapide
./scripts/preview.sh

# Développement avec cache nettoyé
./scripts/preview.sh -c

# Voir les brouillons pendant l'écriture
./scripts/preview.sh -d

# Mode complet (brouillons + futurs + clean)
./scripts/preview.sh -c -d -f
```

### Validation avant PR

```bash
# Valider tout le contenu
./scripts/validate.sh

# Si erreurs détectées, les corriger
# Puis valider à nouveau
./scripts/validate.sh
```

---

## ⚙️ Configuration

### Rendre les scripts exécutables

```bash
# Donner les permissions d'exécution
chmod +x scripts/*.sh

# Vérifier
ls -l scripts/
```

### Variables d'environnement

Les scripts utilisent ces couleurs ANSI :
- 🔴 `RED` : Erreurs
- 🟢 `GREEN` : Succès
- 🟡 `YELLOW` : Avertissements
- 🔵 `BLUE` : Informations

---

## 🐛 Résolution de problèmes

### Script non exécutable

```bash
# Erreur : Permission denied
chmod +x scripts/nom-script.sh
```

### Bundle non trouvé

```bash
# Installer bundler
gem install bundler

# Installer les dépendances
bundle install
```

### Port déjà utilisé

```bash
# Utiliser un port différent
./scripts/preview.sh -p 4001

# Ou tuer le processus sur le port 4000
lsof -ti:4000 | xargs kill -9
```

### Jekyll ne démarre pas

```bash
# Nettoyer le cache
./scripts/preview.sh -c

# Réinstaller les dépendances
rm Gemfile.lock
bundle install
```

---

## 💡 Astuces

### Alias shell

Ajoutez ces alias à votre `.bashrc` ou `.zshrc` :

```bash
# Alias pour le blog
alias blog-new='./scripts/new-article.sh'
alias blog-preview='./scripts/preview.sh'
alias blog-validate='./scripts/validate.sh'

# Workflow complet
alias blog-start='cd ~/blog && ./scripts/preview.sh'
```

Usage :
```bash
blog-new reflexion-temps "Réflexion sur le Temps"
blog-preview -d
blog-validate
```

### Fonction shell personnalisée

```bash
# Ajouter à .bashrc/.zshrc
blog() {
    case $1 in
        new)
            ./scripts/new-article.sh "${@:2}"
            ;;
        preview)
            ./scripts/preview.sh "${@:2}"
            ;;
        validate)
            ./scripts/validate.sh
            ;;
        *)
            echo "Usage: blog {new|preview|validate} [args]"
            ;;
    esac
}
```

Usage :
```bash
blog new mon-article "Mon Titre"
blog preview -d
blog validate
```

---

## 📚 Ressources

- [Bash scripting guide](https://www.gnu.org/software/bash/manual/)
- [Jekyll documentation](https://jekyllrb.com/docs/)
- [Git workflow](https://www.atlassian.com/git/tutorials/comparing-workflows)

---

## 🤝 Contribution

Vous avez des idées pour de nouveaux scripts ? N'hésitez pas à :
1. Créer une issue pour proposer le script
2. Soumettre une PR avec votre script
3. Documenter le script dans ce README

---

**Ces scripts sont là pour vous faciliter la vie. Utilisez-les !** 🚀
