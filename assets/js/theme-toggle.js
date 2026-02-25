(function() {
  'use strict';

  const THEME_KEY = 'theme-preference';
  const LIGHT = 'light';
  const DARK = 'dark';

  // Get theme preference
  function getThemePreference() {
    const stored = localStorage.getItem(THEME_KEY);
    if (stored) {
      return stored;
    }
    
    // Check system preference
    if (window.matchMedia && window.matchMedia('(prefers-color-scheme: dark)').matches) {
      return DARK;
    }
    
    return LIGHT;
  }

  // Set theme
  function setTheme(theme) {
    document.documentElement.setAttribute('data-theme', theme);
    localStorage.setItem(THEME_KEY, theme);
  }

  // Toggle theme
  function toggleTheme() {
    const currentTheme = document.documentElement.getAttribute('data-theme');
    const systemPrefersDark = window.matchMedia('(prefers-color-scheme: dark)').matches;
    
    let newTheme;
    if (currentTheme === LIGHT) {
      newTheme = DARK;
    } else if (currentTheme === DARK) {
      newTheme = LIGHT;
    } else {
      // No theme set, toggle from system preference
      newTheme = systemPrefersDark ? LIGHT : DARK;
    }
    
    setTheme(newTheme);
  }

  // Initialize theme on page load
  function initTheme() {
    const theme = getThemePreference();
    setTheme(theme);
  }

  // Setup toggle button
  function setupToggleButton() {
    const toggleButton = document.getElementById('theme-toggle');
    if (toggleButton) {
      toggleButton.addEventListener('click', toggleTheme);
      
      // Keyboard support
      toggleButton.addEventListener('keydown', function(e) {
        if (e.key === 'Enter' || e.key === ' ') {
          e.preventDefault();
          toggleTheme();
        }
      });
    }
  }

  // Listen to system theme changes
  function watchSystemTheme() {
    if (window.matchMedia) {
      const darkModeQuery = window.matchMedia('(prefers-color-scheme: dark)');
      
      // Modern browsers
      if (darkModeQuery.addEventListener) {
        darkModeQuery.addEventListener('change', function(e) {
          // Only auto-switch if user hasn't manually set preference
          if (!localStorage.getItem(THEME_KEY)) {
            setTheme(e.matches ? DARK : LIGHT);
          }
        });
      }
      // Older browsers
      else if (darkModeQuery.addListener) {
        darkModeQuery.addListener(function(e) {
          if (!localStorage.getItem(THEME_KEY)) {
            setTheme(e.matches ? DARK : LIGHT);
          }
        });
      }
    }
  }

  // Initialize everything when DOM is ready
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', function() {
      setupToggleButton();
      watchSystemTheme();
    });
  } else {
    setupToggleButton();
    watchSystemTheme();
  }

  // Initialize theme immediately to prevent FOUC
  initTheme();
})();
