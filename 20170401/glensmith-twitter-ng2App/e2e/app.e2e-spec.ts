import { MyappCliPage } from './app.po';

describe('myapp-cli App', () => {
  let page: MyappCliPage;

  beforeEach(() => {
    page = new MyappCliPage();
  });

  it('should display message saying app works', () => {
    page.navigateTo();
    expect(page.getParagraphText()).toEqual('app works!');
  });
});
