const redirectAfterIntro = () => {
  const video = document.querySelector("#intro");
  if (!video) return;
  video.onended = function () {
    window.location.replace("/home");
  };
}

export { redirectAfterIntro };
