import { WaveGroup } from "./wavegroup.js";

class App {
  constructor() {
    this.canvas = document.createElement('canvas'); // createElement : 요소를 만드는 메서드. js -> html에 요소를 넣기 위해 사용. appendChild가 필요
    this.ctx = this.canvas.getContext('2d');
    document.body.appendChild(this.canvas); // appendChild() : 선택한 요소 안에 자식요소를 추가한다.

    this.waveGroup = new WaveGroup(); // 1. wave 생성

    window.addEventListener('resize', this.resize.bind(this), false); //this - this 바인드 : bind함수를 사용하면 this는 내가 정한 object로 고정된다.그전에 만약 bind가 되있다면 그 bind를 무시하고 object를 고정하게 된다.
    this.resize();

    requestAnimationFrame(this.animate.bind(this)); // requestAnimationFrame(반복할 함수)
    // 캔버스를 생성 -> resize 이벤트 -> requestAnimationFrame으로 애니메이션 시작
  }

  resize() {
    this.stageWidth = document.body.clientWidth; // clientWidth, Height : 실제로 보여지고 있는 컨텐츠가 얼마만큼의 공간을 차지하고 있는지 확인
    this.stageHeight = document.body.clientHeight;

    this.canvas.width = this.stageWidth * 2;
    this.canvas.height = this.stageHeight * 2;
    this.ctx.scale(2, 2);
    // resize 이벤트에선 캔버스를 더블사이즈로 지정하여 레티나 디스플레이에서도 잘 보이도록 변경

    this.waveGroup.resize(this.stageWidth, this.stageHeight); // 2. wave resizing
  }

  animate(t) {
    this.ctx.clearRect(0, 0, this.stageWidth, this.stageHeight); // 캔버스안에서 특정 영역을 지울 때 사용하는데, x = 0, y = 0, w = width, h = height로 설정하면 캔버스의 전체영역을 지울 수 있게 된다.

    this.waveGroup.draw(this.ctx); // 3. wave 그리기

    requestAnimationFrame(this.animate.bind(this));
    // 캔버스 클리어시켜주는 clearRect함수를 animate()에 추가
  }
}

window.onload = () => {
  new App();
  // 윈도우 load하여 App 생성
};
