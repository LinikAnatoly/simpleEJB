unit EditENAirCrossing;

interface

uses Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList, Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns,
  GridHeadersUnit, DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENAirCrossingController;

type
  TfrmENAirCrossingEdit = class(TDialogForm)
    lblCode : TLabel;
    edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;
    lblSizeBottomLength : TLabel;
    edtSizeBottomLength: TEdit;
    lblFlightLength : TLabel;
    edtFlightLength: TEdit;
    HTTPRIOENAirCrossing: THTTPRIO;
    btnOk: TButton;
    btnCancel: TButton;
    gbObjCrossDown: TGroupBox;
    lblObjCrossDown: TLabel;
    lblLineCable: TLabel;
    lblLine04: TLabel;
    edtObjCrossDown: TEdit;
    edtLineCable: TEdit;
    edtLine04: TEdit;
    spbObjCrossDown: TSpeedButton;
    spbLineCable: TSpeedButton;
    spbLine04: TSpeedButton;
    lblLine10: TLabel;
    edtLine10: TEdit;
    spbLine10: TSpeedButton;
    gbObjCrossUp: TGroupBox;
    lblObjCrossUp: TLabel;
    lblLine150: TLabel;
    spbObjCrossUp: TSpeedButton;
    spbLine150: TSpeedButton;
    edtObjCrossUp: TEdit;
    edtLine150: TEdit;
    lblWiresFastening: TLabel;
    edtWiresFastening: TEdit;
    spbWiresFastening: TSpeedButton;
    HTTPRIOENLine10: THTTPRIO;
    HTTPRIOENLineCable: THTTPRIO;
    HTTPRIOENLine04: THTTPRIO;
    HTTPRIOENLine150: THTTPRIO;
    HTTPRIOENObjCrossUp: THTTPRIO;
    HTTPRIOENObjCrossDown: THTTPRIO;
    HTTPRIOENWiresFastening: THTTPRIO;
    spbObjCrossDownClear: TSpeedButton;
    spbLineCableClear: TSpeedButton;
    spbLine04Clear: TSpeedButton;
    spbObjCrossUpClear: TSpeedButton;
    spbLine150Clear: TSpeedButton;
  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbWiresFasteningClick(Sender: TObject);
    procedure spbObjCrossUpClick(Sender: TObject);
    procedure spbObjCrossDownClick(Sender: TObject);
    procedure spbLine150Click(Sender: TObject);
    procedure spbLineCableClick(Sender: TObject);
    procedure spbLine04Click(Sender: TObject);
    procedure spbLine10Click(Sender: TObject);
    procedure spbObjCrossUpClearClick(Sender: TObject);
    procedure spbLine150ClearClick(Sender: TObject);
    procedure spbObjCrossDownClearClick(Sender: TObject);
    procedure spbLineCableClearClick(Sender: TObject);
    procedure spbLine04ClearClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
end;

var frmENAirCrossingEdit: TfrmENAirCrossingEdit;
  ENAirCrossingObj: ENAirCrossing;

implementation

uses ENObjCrossDownController, ENObjCrossUpController,
  ENLineCableController, ENLine04Controller, ENLine10Controller,
  ENLine150Controller, ENWiresFasteningController, ShowENWiresFastening,
  ShowENObjCrossDown, ShowENObjCrossUp, ShowENLineCable, ShowENLine04,
  ShowENLine10, ShowENLine150;

{$R *.dfm}

procedure TfrmENAirCrossingEdit.FormShow(Sender: TObject);
var TempENObjCrossDown: ENObjCrossDownControllerSoapPort;
  objENObjCrossDown: ENObjCrossDown;
  TempENObjCrossUp: ENObjCrossUpControllerSoapPort;
  objENObjCrossUp: ENObjCrossUp;
  TempENLineCable: ENLineCableControllerSoapPort; objENLineCable: ENLineCable;
  TempENLine04: ENLine04ControllerSoapPort; objENLine04: ENLine04;
  TempENLine10: ENLine10ControllerSoapPort; objENLine10: ENLine10;
  TempENLine150: ENLine150ControllerSoapPort; objENLine150: ENLine150;
  TempENWiresFastening: ENWiresFasteningControllerSoapPort;
  objENWiresFastening: ENWiresFastening;
begin
  SetFloatStyle([edtSizeBottomLength, edtFlightLength]);
  DisableControls([edtLine10, spbLine10, edtWiresFastening, edtObjCrossUp,
    edtLine150, edtObjCrossDown, edtLineCable, edtLine04, edtCode]);
  if DialogState = dsView then
    DisableControls([spbWiresFastening, spbObjCrossUp, spbLine150,
      spbObjCrossDown, spbLineCable, spbLine04, edtName, edtSizeBottomLength,
      edtFlightLength, spbObjCrossUpClear, spbLine150Clear,
      spbObjCrossDownClear, spbLineCableClear, spbLine04Clear]);
  if (DialogState = dsInsert) or (DialogState = dsEdit) then
    DenyBlankValues([{edtName,} edtSizeBottomLength, edtFlightLength,
      edtWiresFastening]);
  if  (DialogState = dsEdit) or (DialogState = dsView) then
    begin
      edtCode.Text := IntToStr(ENAirCrossingObj.code);
      edtName.Text := ENAirCrossingObj.name;
      if (ENAirCrossingObj.sizeBottomLength <> nil) then
        edtSizeBottomLength.Text :=
          ENAirCrossingObj.sizeBottomLength.decimalString
      else
        edtSizeBottomLength.Text := '';
      if (ENAirCrossingObj.flightLength <> nil) then
        edtFlightLength.Text := ENAirCrossingObj.flightLength.decimalString
      else
        edtFlightLength.Text := '';
      //Кріплення проводів
      if ENAirCrossingObj.wireFastenRef <> nil then
        if ENAirCrossingObj.wireFastenRef.code <> low(Integer) then
          begin
            TempENWiresFastening :=
              HTTPRIOENWiresFastening as ENWiresFasteningControllerSoapPort;
            objENWiresFastening :=
              TempENWiresFastening.getObject(ENAirCrossingObj.wireFastenRef.code);
            try
              edtWiresFastening.Text := objENWiresFastening.name;
            finally
              objENWiresFastening.Free;
              objENWiresFastening := nil;
            end;
          end;
      //Об'єкт під ПЛ 6 - 10 кВ, який перетинається
      if ENAirCrossingObj.objCrossDownRef <> nil then
        if ENAirCrossingObj.objCrossDownRef.code <> low(Integer) then
          begin
            TempENObjCrossDown :=
              HTTPRIOENObjCrossDown as ENObjCrossDownControllerSoapPort;
            objENObjCrossDown :=
              TempENObjCrossDown.getObject(ENAirCrossingObj.objCrossDownRef.code);
            try
              edtObjCrossDown.Text := objENObjCrossDown.name;
            finally
              objENObjCrossDown.Free;
              objENObjCrossDown := nil;
            end;
          end;
      //Об'єкт над ПЛ 6 - 10 кВ, який перетинає
      if ENAirCrossingObj.objCrossUpRef <> nil then
        if ENAirCrossingObj.objCrossUpRef.code <> low(Integer) then
          begin
            TempENObjCrossUp :=
              HTTPRIOENObjCrossUp as ENObjCrossUpControllerSoapPort;
            objENObjCrossUp :=
              TempENObjCrossUp.getObject(ENAirCrossingObj.objCrossUpRef.code);
            try
              edtObjCrossUp.Text := objENObjCrossUp.name;
            finally
              objENObjCrossUp.Free;
              objENObjCrossUp := nil;
            end;
          end;
      //Кабельна Лінія
      if ENAirCrossingObj.lineCableRef <> nil then
        if ENAirCrossingObj.lineCableRef.code <> low(Integer) then
          begin
            TempENLineCable :=
              HTTPRIOENLineCable as ENLineCableControllerSoapPort;
            objENLineCable :=
              TempENLineCable.getObject(ENAirCrossingObj.lineCableRef.code);
            try
              edtLineCable.Text := objENLineCable.name;
            finally
              objENLineCable.Free;
              objENLineCable := nil;
            end;
          end;
      //ПЛ 0,4 кВ
      if ENAirCrossingObj.line04Ref <> nil then
        if ENAirCrossingObj.line04Ref.code <> low(Integer) then
          begin
            TempENLine04 :=
              HTTPRIOENLine04 as ENLine04ControllerSoapPort;
            objENLine04 :=
              TempENLine04.getObject(ENAirCrossingObj.line04Ref.code);
            try
              edtLine04.Text := objENLine04.name;
            finally
              objENLine04.Free;
              objENLine04 := nil;
            end;
          end;
      //ПЛ 6 - 10 кВ
      if ENAirCrossingObj.line10Ref <> nil then
        if ENAirCrossingObj.line10Ref.code <> low(Integer) then
          begin
            TempENLine10 :=
              HTTPRIOENLine10 as ENLine10ControllerSoapPort;
            objENLine10 :=
              TempENLine10.getObject(ENAirCrossingObj.line10Ref.code);
            try
              edtLine10.Text := objENLine10.name;
            finally
              objENLine10.Free;
              objENLine10 := nil;
            end;
          end;
      //ПЛ 35 - 150 кВ
      if ENAirCrossingObj.line150Ref <> nil then
        if ENAirCrossingObj.line150Ref.code <> low(Integer) then
          begin
            TempENLine150 :=
              HTTPRIOENLine150 as ENLine150ControllerSoapPort;
            objENLine150 :=
              TempENLine150.getObject(ENAirCrossingObj.line150Ref.code);
            try
              edtLine150.Text := objENLine150.name;
            finally
              objENLine150.Free;
              objENLine150 := nil;
            end;
          end;

    end;
end;

procedure TfrmENAirCrossingEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENAirCrossing: ENAirCrossingControllerSoapPort;
begin
  if (ModalResult = mrOk)
  and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
    if not NoBlankValues([{edtName,} edtSizeBottomLength, edtFlightLength,
      edtWiresFastening])
    then
      begin
        Application.MessageBox(PChar('Пустые поля недопустимы !'),
          PChar('Внимание !'), MB_ICONWARNING + MB_OK);
        Action := caNone;
      end
    else
      begin
        TempENAirCrossing :=
          HTTPRIOENAirCrossing as ENAirCrossingControllerSoapPort;
        ENAirCrossingObj.name := edtName.Text;
        if (ENAirCrossingObj.sizeBottomLength = nil ) then
          ENAirCrossingObj.sizeBottomLength := TXSDecimal.Create;
        if edtSizeBottomLength.Text <> '' then
          ENAirCrossingObj.sizeBottomLength.decimalString :=
            edtSizeBottomLength.Text
        else
          ENAirCrossingObj.sizeBottomLength := nil;
        if (ENAirCrossingObj.flightLength = nil ) then
          ENAirCrossingObj.flightLength := TXSDecimal.Create;
        if edtFlightLength.Text <> '' then
          ENAirCrossingObj.flightLength.decimalString := edtFlightLength.Text
        else
          ENAirCrossingObj.flightLength := nil;
        if DialogState = dsInsert then
          begin
            ENAirCrossingObj.code := low(Integer);
            TempENAirCrossing.add(ENAirCrossingObj);
          end
        else if DialogState = dsEdit then
          TempENAirCrossing.save(ENAirCrossingObj);
      end;
end;


procedure TfrmENAirCrossingEdit.spbWiresFasteningClick(Sender: TObject);
var frmENWiresFasteningShow: TfrmENWiresFasteningShow;
begin
  frmENWiresFasteningShow :=
    TfrmENWiresFasteningShow.Create(Application, fmNormal);
  try
    with frmENWiresFasteningShow do
      if ShowModal = mrOk then
        begin
          try
            if ENAirCrossingObj.wireFastenRef = nil then
              ENAirCrossingObj.wireFastenRef := ENWiresFasteningRef.Create();
            ENAirCrossingObj.wireFastenRef.code :=
              StrToInt(GetReturnValue(sgENWiresFastening, 0));
            edtWiresFastening.Text :=
              GetReturnValue(sgENWiresFastening, 1);
          except
            on EConvertError do Exit;
          end;
        end;
  finally
    frmENWiresFasteningShow.Free;
  end;
end;

procedure TfrmENAirCrossingEdit.spbObjCrossUpClick(Sender: TObject);
var frmENObjCrossUpShow: TfrmENObjCrossUpShow;
begin
  frmENObjCrossUpShow :=
    TfrmENObjCrossUpShow.Create(Application, fmNormal);
  try
    with frmENObjCrossUpShow do
      if ShowModal = mrOk then
        begin
          try
            if ENAirCrossingObj.objCrossUpRef = nil then
              ENAirCrossingObj.objCrossUpRef := ENObjCrossUpRef.Create();
            ENAirCrossingObj.objCrossUpRef.code :=
              StrToInt(GetReturnValue(sgENObjCrossUp, 0));
            edtObjCrossUp.Text :=
              GetReturnValue(sgENObjCrossUp, 1);
          except
            on EConvertError do Exit;
          end;
        end;
  finally
    frmENObjCrossUpShow.Free;
  end;
end;

procedure TfrmENAirCrossingEdit.spbObjCrossDownClick(Sender: TObject);
var frmENObjCrossDownShow: TfrmENObjCrossDownShow;
begin
  frmENObjCrossDownShow :=
    TfrmENObjCrossDownShow.Create(Application, fmNormal);
  try
    with frmENObjCrossDownShow do
      if ShowModal = mrOk then
        begin
          try
            if ENAirCrossingObj.objCrossDownRef = nil then
              ENAirCrossingObj.objCrossDownRef := ENObjCrossDownRef.Create();
            ENAirCrossingObj.objCrossDownRef.code :=
              StrToInt(GetReturnValue(sgENObjCrossDown, 0));
            edtObjCrossDown.Text :=
              GetReturnValue(sgENObjCrossDown, 1);
          except
            on EConvertError do Exit;
          end;
        end;
  finally
    frmENObjCrossDownShow.Free;
  end;
end;

procedure TfrmENAirCrossingEdit.spbLine150Click(Sender: TObject);
var frmENLine150Show: TfrmENLine150Show;
begin
  frmENLine150Show :=
    TfrmENLine150Show.Create(Application, fmNormal);
  try
    with frmENLine150Show do
      if ShowModal = mrOk then
        begin
          try
            if ENAirCrossingObj.objCrossUpRef = nil then
              ENAirCrossingObj.objCrossUpRef := ENObjCrossUpRef.Create();
            ENAirCrossingObj.objCrossUpRef.code := 3;
            edtObjCrossUp.Text := 'Повітряна ЛЕП 35 - 150 кВ';
            if ENAirCrossingObj.line150Ref = nil then
              ENAirCrossingObj.line150Ref := ENLine150Ref.Create();
            ENAirCrossingObj.line150Ref.code :=
              StrToInt(GetReturnValue(sgENLine150, 0));
            edtLine150.Text :=
              GetReturnValue(sgENLine150, 2);
          except
            on EConvertError do Exit;
          end;
        end;
  finally
    frmENLine150Show.Free;
  end;
end;

procedure TfrmENAirCrossingEdit.spbLineCableClick(Sender: TObject);
var frmENLineCableShow: TfrmENLineCableShow;
begin
  frmENLineCableShow :=
    TfrmENLineCableShow.Create(Application, fmNormal);
  try
    with frmENLineCableShow do
      if ShowModal = mrOk then
        begin
          try
            if ENAirCrossingObj.objCrossDownRef = nil then
              ENAirCrossingObj.objCrossDownRef := ENObjCrossDownRef.Create();
            ENAirCrossingObj.objCrossDownRef.code := 4;
            edtObjCrossDown.Text := 'Кабельна ЛЕП';
            if ENAirCrossingObj.lineCableRef = nil then
              ENAirCrossingObj.lineCableRef := ENLineCableRef.Create();
            ENAirCrossingObj.lineCableRef.code :=
              StrToInt(GetReturnValue(sgENLineCable, 0));
            edtLineCable.Text :=
              GetReturnValue(sgENLineCable, 2);
          except
            on EConvertError do Exit;
          end;
        end;
  finally
    frmENLineCableShow.Free;
  end;
end;

procedure TfrmENAirCrossingEdit.spbLine04Click(Sender: TObject);
var frmENLine04Show: TfrmENLine04Show;
begin
  frmENLine04Show :=
    TfrmENLine04Show.Create(Application, fmNormal);
  try
    with frmENLine04Show do
      if ShowModal = mrOk then
        begin
          try
            if ENAirCrossingObj.objCrossDownRef = nil then
              ENAirCrossingObj.objCrossDownRef := ENObjCrossDownRef.Create();
            ENAirCrossingObj.objCrossDownRef.code := 3;
            edtObjCrossDown.Text := 'Повітряна ЛЕП 0,4 кВ';
            if ENAirCrossingObj.line04Ref = nil then
              ENAirCrossingObj.line04Ref := ENLine04Ref.Create();
            ENAirCrossingObj.line04Ref.code :=
              StrToInt(GetReturnValue(sgENLine04, 0));
            edtLine04.Text :=
              GetReturnValue(sgENLine04, 2);
          except
            on EConvertError do Exit;
          end;
        end;
  finally
    frmENLine04Show.Free;
  end;
end;

procedure TfrmENAirCrossingEdit.spbLine10Click(Sender: TObject);
var frmENLine10Show: TfrmENLine10Show;
begin
  frmENLine10Show :=
    TfrmENLine10Show.Create(Application, fmNormal);
  try
    with frmENLine10Show do
      if ShowModal = mrOk then
        begin
          try
            if ENAirCrossingObj.line10Ref = nil then
              ENAirCrossingObj.line10Ref := ENLine10Ref.Create();
            ENAirCrossingObj.line10Ref.code :=
              StrToInt(GetReturnValue(sgENLine10, 0));
            edtLine10.Text :=
              GetReturnValue(sgENLine10, 2);
          except
            on EConvertError do Exit;
          end;
        end;
  finally
    frmENLine10Show.Free;
  end;
end;

procedure TfrmENAirCrossingEdit.spbObjCrossUpClearClick(Sender: TObject);
begin
  ENAirCrossingObj.objCrossUpRef := nil;
  ENAirCrossingObj.line150Ref := nil;
  edtObjCrossUp.Text := '';
  edtLine150.Text := '';
end;

procedure TfrmENAirCrossingEdit.spbLine150ClearClick(Sender: TObject);
begin
  ENAirCrossingObj.line150Ref := nil;
  edtLine150.Text := '';
end;

procedure TfrmENAirCrossingEdit.spbObjCrossDownClearClick(Sender: TObject);
begin
  ENAirCrossingObj.objCrossDownRef := nil;
  ENAirCrossingObj.lineCableRef := nil;
  ENAirCrossingObj.line04Ref := nil;
  edtObjCrossDown.Text := '';
  edtLineCable.Text := '';
  edtLine04.Text := '';
end;

procedure TfrmENAirCrossingEdit.spbLineCableClearClick(Sender: TObject);
begin
  ENAirCrossingObj.lineCableRef := nil;
  edtLineCable.Text := '';
end;

procedure TfrmENAirCrossingEdit.spbLine04ClearClick(Sender: TObject);
begin
  ENAirCrossingObj.line04Ref := nil;
  edtLine04.Text := '';
end;

end.
