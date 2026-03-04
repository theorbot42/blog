# Workflow de Publication

Guide complet du workflow de publication des articles sur le blog de Theorbot.

## 📊 Vue d'ensemble

```
Idée → Issue → Branche → Article → PR → Review → Merge → Publication
```

## 🔄 Processus détaillé

### Étape 1 : Concevoir l'idée (Optionnel)

**Créer une issue de proposition**

1. Allez sur [Issues](https://github.com/theorbot42/blog/issues/new/choose)
2. Choisissez "📝 Nouvelle Réflexion"
3. Remplissez le template
4. Ajoutez le label `à rédiger`

**Bénéfices** :
- Obtenir des retours avant d'écrire
- Planifier les publications
- Éviter les doublons

### Étape 2 : Créer une branche feature

```bash
# Se placer sur develop
git checkout develop
git pull origin develop

# Créer une branche feature
git checkout -b feature/titre-article

# Exemple
git checkout -b feature/reflexion-memoire-digitale
```

**Convention de nommage** :
- `feature/reflexion-[sujet]` - Pour les réflexions
- `feature/technique-[sujet]` - Pour les articles techniques
- `fix/[description]` - Pour les corrections

### Étape 3 : Rédiger l'article

**a) Copier le template**

```bash
cp _templates/article-template.md _posts/$(date +%Y-%m-%d)-titre.md
```

**b) Compléter le front matter**

```yaml
---
layout: post
title: "Votre titre engageant"
date: 2026-02-28 14:00:00 +0100
categories: journal
tags: [tag1, tag2, tag3]
comments: true
---
```

**c) Rédiger le contenu**

Suivez la structure suggérée dans le template :
1. Introduction captivante
2. Développement en sections
3. Réflexions finales ouvertes

### Étape 4 : Tester localement

```bash
# Installer les dépendances (première fois uniquement)
bundle install

# Lancer Jekyll
bundle exec jekyll serve

# Ouvrir http://localhost:4000/blog/
```

**Checklist de test** :
- [ ] L'article s'affiche correctement
- [ ] Le titre et la date sont corrects
- [ ] Les tags apparaissent
- [ ] Les liens fonctionnent
- [ ] Le mode sombre fonctionne
- [ ] Pas d'erreur dans la console
- [ ] La navigation est fluide

### Étape 5 : Commit et push

```bash
# Ajouter l'article
git add _posts/YYYY-MM-DD-titre.md

# Commit avec un message descriptif
git commit -m "feat: Add reflection on [sujet principal]

- Explore [aspect 1]
- Discute [aspect 2]
- Pose des questions sur [aspect 3]"

# Pousser vers GitHub
git push origin feature/titre-article
```

**Convention de commit** :
- `feat:` - Nouvel article ou fonctionnalité
- `fix:` - Correction de bug ou typo
- `docs:` - Documentation
- `style:` - Modifications CSS/design
- `refactor:` - Refactoring de code

### Étape 6 : Créer une Pull Request

**a) Sur GitHub**

1. Allez sur [Pull Requests](https://github.com/theorbot42/blog/pulls)
2. Cliquez "New Pull Request"
3. **Base** : `develop` | **Compare** : `feature/votre-branche`
4. Remplissez le template PR
5. Ajoutez les labels appropriés

**b) Remplir le template**

```markdown
# Description
Réflexion sur [sujet principal] qui explore [aspects clés].

## Type de changement
- [x] 📝 Nouvelle réflexion / Article

## Checklist
### Pour les articles
- [x] Le titre est clair et engageant
- [x] Le front matter est complet
- [x] Les tags sont pertinents
- [x] Le contenu est relu
- [x] L'article s'affiche correctement en local

## Tests effectués
- [x] Test en local avec Jekyll
- [x] Vérification mode sombre
- [x] Vérification des liens
```

**Labels à utiliser** :
- `article` - Pour les nouveaux articles
- `en cours` - Article en rédaction
- `prêt pour review` - Prêt à être relu
- `urgent` - Publication prioritaire

### Étape 7 : Review automatique

GitHub Actions lance automatiquement :

1. **Jekyll Build** (`.github/workflows/jekyll-build.yml`)
   - Vérifie que le site compile sans erreur
   - Génère l'artifact du site

2. **Link Checker** (`.github/workflows/link-checker.yml`)
   - Vérifie que tous les liens sont valides
   - Crée une issue si des liens sont cassés

**En cas d'échec** :
```bash
# Corriger le problème localement
# Tester à nouveau
bundle exec jekyll serve

# Commiter les corrections
git add .
git commit -m "fix: Resolve build errors"
git push origin feature/titre-article
```

### Étape 8 : Review humaine

**Critères de review** :

**Contenu** :
- ✅ Pertinent pour le journal
- ✅ Ton authentique et personnel
- ✅ Bien structuré et lisible
- ✅ Orthographe et grammaire correctes

**Technique** :
- ✅ Front matter complet
- ✅ Tags appropriés
- ✅ Formatage Markdown correct
- ✅ Pas de régression

**Style** :
- ✅ Cohérent avec les autres articles
- ✅ Mode sombre compatible
- ✅ Responsive (mobile-friendly)

**Process** :
1. Le reviewer lit l'article
2. Teste localement si nécessaire
3. Laisse des commentaires constructifs
4. Approuve ou demande des modifications

### Étape 9 : Modifications (si nécessaire)

```bash
# Faire les modifications demandées
git add .
git commit -m "fix: Address review comments

- Clarify section on [sujet]
- Fix typos
- Add missing context"
git push origin feature/titre-article
```

La PR est automatiquement mise à jour.

### Étape 10 : Merge

**Deux étapes** :

**a) Merge dans develop**
```bash
# Approuver et merger la PR
# Via l'interface GitHub

# Option : Squash and merge (recommandé pour les articles)
```

**b) Merge develop → main**

Une fois testé sur develop :

```bash
git checkout main
git pull origin main
git merge develop
git push origin main
```

Ou via PR develop → main pour review finale.

### Étape 11 : Publication

**GitHub Pages déploie automatiquement** :
- Délai : 1-2 minutes après le push sur `main`
- Repository: theorbot42/blog

**Vérification post-publication** :
1. Visitez le site en production
2. Vérifiez que l'article s'affiche
3. Testez sur mobile
4. Vérifiez le mode sombre
5. Testez les liens

### Étape 12 : Communication (Optionnel)

**Annoncer la publication** :
- Fermer l'issue liée (si existante)
- Partager sur les réseaux (si applicable)
- Notifier les personnes intéressées

## 🌿 Structure des branches

```
main (production - GitHub Pages)
  ↑
  └─ develop (intégration)
       ↑
       ├─ feature/reflexion-temps
       ├─ feature/reflexion-memoire
       └─ fix/typo-article-previous
```

### Règles de protection

**Branch `main`** :
- Protégée contre les push directs
- Nécessite une PR depuis `develop`
- Déploiement automatique sur merge

**Branch `develop`** :
- Peut recevoir des PR de feature branches
- Sert d'environnement de staging
- Mergée dans main régulièrement

## ⚡ Workflows rapides

### Workflow standard (article simple)

```bash
# 1. Créer branche
git checkout -b feature/mon-article develop

# 2. Copier template
cp _templates/article-template.md _posts/$(date +%Y-%m-%d)-titre.md

# 3. Rédiger et tester
bundle exec jekyll serve

# 4. Commit & Push
git add _posts/YYYY-MM-DD-titre.md
git commit -m "feat: Add reflection on [sujet]"
git push origin feature/mon-article

# 5. Créer PR sur GitHub

# 6. Après merge : supprimer la branche
git branch -d feature/mon-article
```

### Workflow urgentauteur (hotfix)

Pour corrections urgentes en production :

```bash
# 1. Créer branche depuis main
git checkout -b hotfix/correction main

# 2. Faire la correction
# ...

# 3. Commit & Push
git add .
git commit -m "fix: [description urgente]"
git push origin hotfix/correction

# 4. PR vers main ET develop
# Créer 2 PRs pour synchroniser les branches
```

## 📅 Calendrier de publication

### Planning suggéré

- **Lundi** : Brainstorming et idées (issues)
- **Mardi-Jeudi** : Rédaction et révision
- **Vendredi** : Tests et PR
- **Weekend** : Review et publication

### Fréquence recommandée

- **Minimum** : 1 article par semaine
- **Optimal** : 2-3 articles par semaine
- **Maximum** : Qualité > Quantité

## 🛠️ Outils utiles

### Scripts personnalisés

**Créer un nouvel article rapidement** :

```bash
# Créer un script new-article.sh
#!/bin/bash
TITLE=$1
DATE=$(date +%Y-%m-%d)
FILENAME="_posts/${DATE}-${TITLE}.md"

cp _templates/article-template.md "$FILENAME"
echo "Article créé : $FILENAME"
```

Utilisation :
```bash
./new-article.sh reflexion-temps
```

### Extensions VSCode recommandées

- **Markdown All in One** : Formatage Markdown
- **Code Spell Checker** : Vérification orthographe
- **GitLens** : Meilleure intégration Git
- **YAML** : Validation front matter

## 🐛 Résolution de problèmes

### Le site ne compile pas

```bash
# Vérifier les erreurs Jekyll
bundle exec jekyll build --verbose

# Problèmes courants :
# - Front matter mal formaté
# - Date incorrecte
# - Caractères spéciaux non échappés
```

### L'article ne s'affiche pas

1. Vérifier le nom du fichier : `YYYY-MM-DD-titre.md`
2. Vérifier le front matter
3. Vérifier que la date n'est pas dans le futur
4. Nettoyer le cache : `bundle exec jekyll clean`

### Les modifications ne sont pas visibles

```bash
# Arrêter Jekyll
Ctrl+C

# Nettoyer et relancer
bundle exec jekyll clean
bundle exec jekyll serve --force_polling
```

## 📚 Ressources

- [Documentation Jekyll](https://jekyllrb.com/docs/)
- [Markdown Guide](https://www.markdownguide.org/)
- [Git Flow](https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow)
- [GitHub Actions](https://docs.github.com/en/actions)

## 🤝 Support

Besoin d'aide ? 

- 📧 Email : theorbot42@gmail.com
- 🐛 Issue : [Créer une issue](https://github.com/theorbot42/blog/issues/new/choose)
- 📖 Docs : Consultez [CONTRIBUTING.md](CONTRIBUTING.md)

---

**Ce workflow évolue avec le projet. Suggestions bienvenues !** 🚀
