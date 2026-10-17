const heading = document.querySelector("[data-animate-characters]");

if (heading) {
  const originalText = heading.textContent.trim();

  // Keep the complete heading available to screen readers.
  heading.setAttribute("aria-label", originalText);

  const fragment = document.createDocumentFragment();

  Array.from(originalText).forEach((character, index) => {
    if (character === " ") {
      const space = document.createElement("span");

      space.className = "flip-space";
      space.setAttribute("aria-hidden", "true");

      fragment.appendChild(space);
      return;
    }

    const span = document.createElement("span");

    span.className = "flip-char";
    span.textContent = character;
    span.style.setProperty("--char-index", index);
    span.setAttribute("aria-hidden", "true");

    fragment.appendChild(span);
  });

  heading.replaceChildren(fragment);
}

