(function () {
  'use strict';

  // ---------- Modal (заявка) ----------
  const modal = document.getElementById('applyModal');
  const form = document.getElementById('applyForm');
  const successBlock = document.getElementById('applySuccess');

  function openModal(prefillTitle) {
    if (!modal) return;
    if (prefillTitle) {
      const titleEl = modal.querySelector('.modal__title');
      if (titleEl) titleEl.textContent = prefillTitle;
    }
    if (form) form.classList.remove('hidden');
    if (successBlock) successBlock.classList.add('hidden');
    modal.classList.add('open');
    document.body.style.overflow = 'hidden';
    const firstInput = modal.querySelector('input, textarea');
    if (firstInput) setTimeout(() => firstInput.focus(), 50);
  }

  function closeModal() {
    if (!modal) return;
    modal.classList.remove('open');
    document.body.style.overflow = '';
    if (form) form.reset();
  }

  document.addEventListener('click', function (e) {
    const opener = e.target.closest('[data-open-modal]');
    if (opener) {
      e.preventDefault();
      const title = opener.getAttribute('data-modal-title');
      openModal(title);
      return;
    }
    if (e.target.matches('[data-close-modal]')) {
      e.preventDefault();
      closeModal();
      return;
    }
    if (modal && e.target === modal) {
      closeModal();
    }
  });

  document.addEventListener('keydown', function (e) {
    if (e.key === 'Escape' && modal && modal.classList.contains('open')) {
      closeModal();
    }
  });

  if (form) {
    form.addEventListener('submit', function (e) {
      e.preventDefault();
      form.classList.add('hidden');
      if (successBlock) successBlock.classList.remove('hidden');
    });
  }

  // ---------- Фильтры (каталог / поиск команды) ----------
  function setupFilters(groupSelector, itemSelector, attr) {
    const group = document.querySelector(groupSelector);
    if (!group) return;
    const items = document.querySelectorAll(itemSelector);
    group.addEventListener('click', function (e) {
      const chip = e.target.closest('.filter-chip');
      if (!chip) return;
      group.querySelectorAll('.filter-chip').forEach((c) => c.classList.remove('active'));
      chip.classList.add('active');
      const value = chip.getAttribute('data-filter');
      items.forEach((item) => {
        const itemVal = item.getAttribute(attr);
        if (value === 'all' || itemVal === value) {
          item.classList.remove('hidden');
        } else {
          item.classList.add('hidden');
        }
      });
    });
  }

  setupFilters('[data-filter-group="catalog"]', '.product', 'data-category');
  setupFilters('[data-filter-group="team"]', '.ad', 'data-role');

  // ---------- Мобильное меню ----------
  const burger = document.querySelector('.burger');
  const nav = document.querySelector('.nav');
  if (burger && nav) {
    burger.addEventListener('click', function () {
      nav.classList.toggle('open');
    });
  }
})();
