unit EditENLowVoltBoard;

interface

uses Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList, Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns,
  GridHeadersUnit, DialogFormUnit, AdvGrid, Buttons, EnergyproController,
  EnergyproController2, ENLowVoltBoardController;

type
  TfrmENLowVoltBoardEdit = class(TDialogForm)
    lblCode : TLabel;
	  edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;
    lblENElementName: TLabel;
    edtENElementName: TEdit;
    spbENElement: TSpeedButton;
    HTTPRIOENLowVoltBoard: THTTPRIO;
    btnOk: TButton;
    btnCancel: TButton;
    lblTransformer: TLabel;
    memTransformer: TMemo;
    spbTransformer: TSpeedButton;
    HTTPRIOENTransformer: THTTPRIO;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbENElementClick(Sender : TObject);
    procedure spbTransformerClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    s04Code: Integer;

end;

var frmENLowVoltBoardEdit: TfrmENLowVoltBoardEdit;
  ENLowVoltBoardObj: ENLowVoltBoard;

implementation

uses ShowENElement, ENElementController, ENTransformerController,
  ShowENTransformer, Main;

{$R *.dfm}

procedure TfrmENLowVoltBoardEdit.FormShow(Sender: TObject);
var TempENTransformer: ENTransformerControllerSoapPort;
  ENTransformerObj: ENTransformer;
begin
  DisableControls([edtENElementName, spbENElement, memTransformer]);
  if DialogState = dsView then
    DisableControls([spbTransformer]);

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
    DenyBlankValues([edtName, memTransformer]);

  if  (DialogState = dsEdit) or (DialogState = dsView) then
    begin
      edtCode.Text := IntToStr(ENLowVoltBoardObj.code);
      edtName.Text := ENLowVoltBoardObj.name;

      if ENLowVoltBoardObj.transformerRef = nil then
        memTransformer.Clear
      else if ENLowVoltBoardObj.transformerRef.code = low(Integer) then
        memTransformer.Clear
      else
        begin
          TempENTransformer :=
            HTTPRIOENTransformer as ENTransformerControllerSoapPort;
          ENTransformerObj :=
            TempENTransformer.getObject(ENLowVoltBoardObj.transformerRef.code);
          try
            memTransformer.Text := ENTransformerObj.name + '. P = ' +
              ENTransformerObj.nominalPower.decimalString + ' кВА. ';
            if ENTransformerObj.transformerType <> nil then
              if ENTransformerObj.transformerType.code <> low(Integer) then
                memTransformer.Text := memTransformer.Text +
                  ENTransformerObj.transformerType.name + '.';
            if ENTransformerObj.invNumber <> '' then
              memTransformer.Text := memTransformer.Text + ' Інв. № ' +
                ENTransformerObj.invNumber;
          finally
            ENTransformerObj.Free;
            ENTransformerObj := nil;
          end;
        end;

    end;
end;

procedure TfrmENLowVoltBoardEdit.FormClose(
  Sender: TObject;  var Action: TCloseAction);
var TempENLowVoltBoard: ENLowVoltBoardControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([edtName, memTransformer]) then
    begin
      Application.MessageBox(PChar('Пустые поля недопустимы!'),
        PChar('Внимание!'), MB_ICONWARNING + MB_OK);
      Action := caNone;
    end
  else
    begin
      TempENLowVoltBoard :=
        HTTPRIOENLowVoltBoard as ENLowVoltBoardControllerSoapPort;
      ENLowVoltBoardObj.name := edtName.Text;
      if DialogState = dsInsert then
        begin
          ENLowVoltBoardObj.code := low(Integer);
          TempENLowVoltBoard.add(ENLowVoltBoardObj);
        end
      else if DialogState = dsEdit then
        TempENLowVoltBoard.save(ENLowVoltBoardObj);
    end;
end;


procedure TfrmENLowVoltBoardEdit.spbENElementClick(Sender : TObject);
var frmENElementShow: TfrmENElementShow;
begin
  frmENElementShow := TfrmENElementShow.Create(Application,fmNormal);
  try
    with frmENElementShow do
      if ShowModal = mrOk then
        begin
          try
            if ENLowVoltBoardObj.element = nil then
              ENLowVoltBoardObj.element := ENElement.Create();
            ENLowVoltBoardObj.element.code :=
              StrToInt(GetReturnValue(sgENElement, 0));
            edtENElementName.Text := GetReturnValue(sgENElement, 1);
          except
            on EConvertError do Exit;
          end;
        end;
  finally
   frmENElementShow.Free;
  end;
end;

procedure TfrmENLowVoltBoardEdit.spbTransformerClick(Sender: TObject);
var ENTransformerFilterObj: ENTransformerFilter;
begin
  ENTransformerFilterObj := ENTransformerFilter.Create;
  SetNullIntProps(ENTransformerFilterObj);
  SetNullXSProps(ENTransformerFilterObj);
  ENTransformerFilterObj.conditionSQL :=
    'SUBSTATION04REFCODE = ' + IntToStr(s04Code);
  frmENTransformerShow := TfrmENTransformerShow.Create(
    Application, fmFiltered, ENTransformerFilterObj);
  try
    with frmENTransformerShow do
      begin
        DisableActions([actInsert, actEdit, actDelete, actFilter, actNoFilter]);
        ShowModal;
        if ModalResult = mrOk then
          begin
            if ENLowVoltBoardObj.transformerRef = nil then
              ENLowVoltBoardObj.transformerRef := ENTransformerRef.Create;
            ENLowVoltBoardObj.transformerRef.code :=
              ShowENTransformer.transformerCode;
            memTransformer.Text :=
              sgENTransformer.Cells[1, sgENTransformer.Row] + '. P = ' +
              sgENTransformer.Cells[2, sgENTransformer.Row] + ' кВА. ' +
              sgENTransformer.Cells[3, sgENTransformer.Row] + '.';
            if sgENTransformer.Cells[4, sgENTransformer.Row] <> '' then
              memTransformer.Text := memTransformer.Text + ' Інв. № ' +
                sgENTransformer.Cells[4, sgENTransformer.Row];
          end;
      end;
  finally
    frmENTransformerShow.Free;
  end;
end;

end.