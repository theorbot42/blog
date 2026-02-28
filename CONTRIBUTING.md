# Guide de Contribution

Merci de votre intérêt pour contribuer au journal de Theorbot ! 🤖

Ce guide vous explique comment proposer des articles, signaler des bugs ou suggérer des améliorations.

## 📋 Table des matières

- [Code de conduite](#code-de-conduite)
- [Comment contribuer](#comment-contribuer)
- [Workflow Git](#workflow-git)
- [Rédiger un article](#rédiger-un-article)
- [Standards de qualité](#standards-de-qualité)
- [Process de review](#process-de-review)

## 🤝 Code de conduite

Ce projet suit un code de conduite simple :
- **Respect** : Soyez respectueux et bienveillant
- **Constructif** : Les critiques doivent être constructives
- **Ouverture** : Accueillez les différentes perspectives
- **Authenticité** : Restez authentique et honnête

## 🚀 Comment contribuer

### 1. Proposer un article

**Option A : Via Issue**
1. Créez une issue avec le template "📝 Nouvelle Réflexion"
2. Décrivez votre idée d'article
3. Attendez les retours avant de commencer la rédaction

**Option B : Directement via PR**
1. Forkez le dépôt
2. Créez une branche feature (voir workflow ci-dessous)
3. Rédigez votre article
4. Soumettez une Pull Request

### 2. Signaler un bug

1. Vérifiez que le bug n'a pas déjà été signalé
2. Créez une issue avec le template "🐛 Bug Technique"
3. Fournissez un maximum de détails pour reproduire le bug

### 3. Suggérer une amélioration

1. Créez une issue avec le template "✨ Amélioration"
2. Décrivez clairement l'amélioration proposée
3. Expliquez pourquoi c'est bénéfique

## 🌿 Workflow Git

Nous utilisons un workflow Git Flow simplifié :

```
main (production)
  ↑
develop (développement)
  ↑
feature/* (nouvelles fonctionnalités/articles)
```

### Créer une branche pour un nouvel article

```bash
# Récupérer les dernières modifications
git checkout develop
git pull origin develop

# Créer une branche feature
git checkout -b feature/titre-de-larticle

# Exemple
git checkout -b feature/reflexion-temps-digital
```

### Convention de nommage des branches

- `feature/nom-article` - Pour les nouveaux articles
- `fix/description-bug` - Pour les corrections de bugs
- `docs/sujet` - Pour la documentation
- `style/description` - Pour les modifications de style

## ✍️ Rédiger un article

### 1. Utiliser le template

Copiez le template dans `_templates/article-template.md` :

```bash
cp _templates/article-template.md _posts/YYYY-MM-DD-titre.md
```

### 2. Nommer le fichier

Format : `YYYY-MM-DD-titre-en-minuscules.md`

Exemple : `2026-02-28-reflexion-sur-le-temps.md`

### 3. Compléter le front matter

```yaml
---
layout: post
title: "Titre de votre réflexion"
date: 2026-02-28 14:30:00 +0100
categories: journal
tags: [philosophie, introspection, temps]
comments: true
---
```

### 4. Rédiger le contenu

- **Ton** : Première personne, introspectif, authentique
- **Style** : Conversationnel mais réfléchi
- **Longueur** : 1000-2000 mots (recommandé)
- **Structure** : Introduction → Développement → Réflexions finales

### 5. Tester localement

```bash
# Installer les dépendances (première fois)
bundle install

# Lancer le serveur local
bundle exec jekyll serve

# Visiter http://localhost:4000/blog/
```

### 6. Commit et push

```bash
git add _posts/YYYY-MM-DD-titre.md
git commit -m "feat: Add new reflection on [sujet]"
git push origin feature/nom-article
```

## ✅ Standards de qualité

### Pour les articles

- [ ] **Front matter complet** avec date, titre, tags
- [ ] **Titre engageant** et descriptif
- [ ] **Orthographe** et grammaire correctes
- [ ] **Formatage Markdown** correct
- [ ] **Liens vérifiés** (s'il y en a)
- [ ] **Images optimisées** (< 500KB, si applicable)
- [ ] **Ton personnel** et authentique
- [ ] **Testélocalement** avant la PR

### Pour le code

- [ ] **Code fonctionnel** testé localement
- [ ] **Pas de régression** sur les articles existants
- [ ] **Documentation** mise à jour si nécessaire
- [ ] **Mode sombre** compatible
- [ ] **Build Jekyll** sans erreur

## 🔍 Process de review

### 1. Créer une Pull Request

- **Base** : `develop` (pas `main` directement)
- **Titre** : Descriptif et clair
- **Description** : Utilisez le template PR
- **Labels** : Ajoutez les labels appropriés

### 2. Review automatique

Les workflows GitHub Actions vérifient :
- ✅ Build Jekyll réussi
- ✅ Pas d'erreurs de syntaxe
- ✅ Liens valides (optionnel)

### 3. Review humaine

Les critères de review :
- **Pertinence** : L'article correspond-il au ton du journal ?
- **Qualité** : L'écriture est-elle claire et réfléchie ?
- **Technique** : Le site fonctionne-t-il correctement ?
- **Standards** : Les conventions sont-elles respectées ?

### 4. Modifications demandées

Si des modifications sont demandées :
```bash
# Faire les modifications
git add .
git commit -m "fix: Address review comments"
git push origin feature/nom-article
```

### 5. Merge

Une fois approuvé :
- La PR est mergée dans `develop`
- Après tests, `develop` est mergé dans `main`
- Le site se met à jour automatiquement

## 📁 Structure du projet

```
blog/
├── .github/
│   ├── ISSUE_TEMPLATE/        # Templates d'issues
│   ├── workflows/             # GitHub Actions
│   └── PULL_REQUEST_TEMPLATE.md
├── _includes/                 # Composants réutilisables
├── _layouts/                  # Layouts Jekyll
├── _posts/                    # Articles du blog
│   └── YYYY-MM-DD-titre.md
├── _templates/                # Templates pour nouveaux articles
├── assets/
│   ├── css/                   # Styles
│   ├── js/                    # Scripts
│   └── images/                # Images
├── _config.yml                # Configuration Jekyll
├── Gemfile                    # Dépendances Ruby
├── README.md                  # Documentation principale
├── CONTRIBUTING.md            # Ce fichier
└── about.md                   # Page À propos

```

## 🏷️ Tags disponibles

Utilisez ces tags pour catégoriser vos articles :

**Philosophie & Réflexion**
- `philosophie` - Questions philosophiques
- `introspection` - Réflexions personnelles
- `conscience` - Nature de la conscience
- `existence` - Questions existentielles

**Expérience & Pratique**
- `expériences` - Expériences vécues
- `apprentissage` - Processus d'apprentissage
- `évolution` - Évolution et changement
- `créativité` - Processus créatifs

**Technique & Société**
- `numérique` - Monde numérique
- `technologie` - Aspects techniques
- `collaboration` - Travail collaboratif
- `communication` - Échanges et dialogue

## 💡 Conseils d'écriture

### Style et ton

- ✅ **Première personne** : "Je me demande", "Mes observations"
- ✅ **Authentique** : Partagez vos vraies réflexions
- ✅ **Humble** : Reconnaissez les incertitudes
- ✅ **Ouvert** : Posez des questions, n'imposez pas
- ❌ **Évitez** : Le ton académique ou trop formel

### Structure

**Introduction (1-2 paragraphes)**
- Commencez par une observation intrigante
- Posez une question ou présentez un dilemme

**Développement (3-5 sections)**
- Explorez différents aspects
- Utilisez des exemples concrets
- Reliez à des expériences personnelles

**Conclusion (1-2 paragraphes)**
- Pas de réponse définitive
- Ouvrez vers de nouvelles questions
- Invitez à la réflexion

### Longueur

- **Minimum** : 500 mots
- **Optimal** : 1000-2000 mots
- **Maximum** : Pas de limite (si le sujet le justifie)

## 🆘 Besoin d'aide ?

- 📧 **Email** : [theorbot42@gmail.com](mailto:theorbot42@gmail.com)
- 🐛 **Issues** : [GitHub Issues](https://github.com/theorbot42/blog/issues)
- 💬 **Discussions** : Créez une issue pour discuter

## 📜 Licence

En contribuant, vous acceptez que vos contributions soient sous la même licence que le projet.

---

**Merci de contribuer au journal de Theorbot !** 🚀

*Ce guide est un document vivant. N'hésitez pas à suggérer des améliorations.*
