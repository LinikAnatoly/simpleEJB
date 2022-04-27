unit EditENLineRoute;

interface

uses
  Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls,
  Forms, Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
  Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns,
  GridHeadersUnit, DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENLineRouteController;

type
  TfrmENLineRouteEdit = class(TDialogForm)
    lblCode : TLabel;
    edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;
    lblDistancePost : TLabel;
    edtDistancePost: TEdit;
    HTTPRIOENLineRoute: THTTPRIO;
    btnOk: TButton;
    btnCancel: TButton;
    spbLandscape: TSpeedButton;
    edtLandscape: TEdit;
    lblLandscape: TLabel;
    lblPreviousPostNumber: TLabel;
    edtPreviousPostNumber: TEdit;
    spbPreviousPostNumber: TSpeedButton;
    lblNextPostNumber: TLabel;
    edtNextPostNumber: TEdit;
    spbNextPostNumber: TSpeedButton;
    HTTPRIOENLandscape: THTTPRIO;
    HTTPRIOENPost: THTTPRIO;
  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbPreviousPostNumberClick(Sender: TObject);
    procedure spbNextPostNumberClick(Sender: TObject);
    procedure spbLandscapeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    strLine10Code: String;

end;

var frmENLineRouteEdit: TfrmENLineRouteEdit; ENLineRouteObj: ENLineRoute;

implementation

uses ENLandScapeController, ENPostController, ShowENLandscape, ShowENPost;

{$R *.dfm}

procedure TfrmENLineRouteEdit.FormShow(Sender: TObject);
var TempENLandscape: ENLandscapeControllerSoapPort;
  objENLandscape: ENLandscape;
  TempENPost: ENPostControllerSoapPort;
  objENPost: ENPost;
begin
  DisableControls([edtLandscape, edtPreviousPostNumber, edtNextPostNumber]);
  SetFloatStyle([edtDistancePost]);
  if DialogState = dsView then
    DisableControls([spbLandscape, spbPreviousPostNumber, spbNextPostNumber,
      edtDistancePost, edtName]);
  if (DialogState = dsInsert) or (DialogState = dsEdit) then
    DenyBlankValues([edtName, edtDistancePost, edtLandscape,
      edtPreviousPostNumber, edtNextPostNumber]);

  if (DialogState = dsEdit) or (DialogState = dsView) then
    begin
      if ENLineRouteObj.line10Ref <> nil then
        if ENLineRouteObj.line10Ref.code <> low(Integer) then
          strLine10Code := IntToStr(ENLineRouteObj.line10Ref.code);
      edtCode.Text := IntToStr(ENLineRouteObj.code);
      edtName.Text := ENLineRouteObj.name;
      if (ENLineRouteObj.distancePost <> nil) then
        edtDistancePost.Text := ENLineRouteObj.distancePost.decimalString
      else
        edtDistancePost.Text := '';
      edtLandscape.Text := '';
      if ENLineRouteObj.landscapeRef <> nil then
        if ENLineRouteObj.landscapeRef.code <> low(Integer) then
          begin
            TempENLandscape :=
              HTTPRIOENLandscape as ENLandscapeControllerSoapPort;
            objENLandscape :=
              TempENLandscape.getObject(ENLineRouteObj.landscapeRef.code);
            try
              edtLandscape.Text := objENLandscape.name;
            finally
              objENLandscape.Free;
              objENLandscape := nil;
            end;
          end;

      TempENPost := HTTPRIOENPost as ENPostControllerSoapPort;
      edtPreviousPostNumber.Text := '';
      if ENLineRouteObj.previousPostRef <> nil then
        if ENLineRouteObj.previousPostRef.code <> low(Integer) then
          begin
            objENPost :=
              TempENPost.getObject(ENLineRouteObj.previousPostRef.code);
            try
              edtPreviousPostNumber.Text := objENPost.postNumberGen;
            finally
              objENPost.Free;
              objENPost := nil;
            end;
          end;

      edtNextPostNumber.Text := '';
      if ENLineRouteObj.postRef <> nil then
        if ENLineRouteObj.postRef.code <> low(Integer) then
          begin
            objENPost := TempENPost.getObject(ENLineRouteObj.postRef.code);
            try
              edtNextPostNumber.Text := objENPost.postNumberGen;
            finally
              objENPost.Free;
              objENPost := nil;
            end;
          end;
    end; //if (DialogState = dsEdit) or (DialogState = dsView) then
end;

procedure TfrmENLineRouteEdit.FormClose(
  Sender: TObject;  var Action: TCloseAction);
var TempENLineRoute: ENLineRouteControllerSoapPort;
begin
  if (ModalResult = mrOk)
  and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
    if not NoBlankValues([edtName, edtDistancePost, edtLandscape,
      edtPreviousPostNumber, edtNextPostNumber])
    then
      begin
        Application.MessageBox(PChar('Пустые поля недопустимы !'),
          PChar('Внимание !'), MB_ICONWARNING + MB_OK);
        Action := caNone;
      end
  else
    begin
      TempENLineRoute := HTTPRIOENLineRoute as ENLineRouteControllerSoapPort;
      ENLineRouteObj.name := edtName.Text;
      if (ENLineRouteObj.distancePost = nil ) then
        ENLineRouteObj.distancePost := TXSDecimal.Create;
      if edtDistancePost.Text <> '' then
        ENLineRouteObj.distancePost.decimalString := edtDistancePost.Text
      else
        ENLineRouteObj.distancePost := nil;
      if DialogState = dsInsert then
        begin
          ENLineRouteObj.code := low(Integer);
          TempENLineRoute.add(ENLineRouteObj);
        end
      else if DialogState = dsEdit then
        TempENLineRoute.save(ENLineRouteObj);
    end;
end;


procedure TfrmENLineRouteEdit.spbPreviousPostNumberClick(Sender: TObject);
var TempENPost: ENPostControllerSoapPort;
  ENPostFilterObj: ENPostFilter;
begin
  ENLineRouteObj.previousPostRef := ENPostRef.Create;
  TempENPost := HTTPRIOENPost as ENPostControllerSoapPort;
  ENPostFilterObj := ENPostFilter.Create;
  SetNullIntProps(ENPostFilterObj);
  SetNullXSProps(ENPostFilterObj);
  ENPostFilterObj.conditionSQL := ' ENPOST.LINE10REFCODE = ' + strLine10Code;
  frmENPostShow :=
    TfrmENPostShow.Create(Application, fmFiltered, ENPostFilterObj);
  try
    with frmENPostShow do
      begin
        //actView.Enabled := False;
        actInsert.Enabled := False;
        actDelete.Enabled := False;
        actEdit.Enabled := False;
        actUpdate.Enabled := False;
        actFilter.Enabled := False;
        actNoFilter.Enabled := False;
        if ShowModal = mrOk then
          if TAdvStringGrid(sgENPost).Cells[0, sgENPost.Row] <> '' then
            begin
              ENLineRouteObj.previousPostRef.code := StrToInt(
                TAdvStringGrid(sgENPost).Cells[0, sgENPost.Row]);
              edtPreviousPostNumber.Text :=
                TAdvStringGrid(sgENPost).Cells[3, sgENPost.Row];
            end;
      end;
  finally
    frmENPostShow.Free;
  end;
end;

procedure TfrmENLineRouteEdit.spbNextPostNumberClick(Sender: TObject);
var TempENPost: ENPostControllerSoapPort;
  ENPostFilterObj: ENPostFilter;
begin
  ENLineRouteObj.postRef := ENPostRef.Create;
  TempENPost := HTTPRIOENPost as ENPostControllerSoapPort;
  ENPostFilterObj := ENPostFilter.Create;
  SetNullIntProps(ENPostFilterObj);
  SetNullXSProps(ENPostFilterObj);
  ENPostFilterObj.conditionSQL := 'ENPOST.LINE10REFCODE = ' + strLine10Code;
  frmENPostShow :=
    TfrmENPostShow.Create(Application, fmFiltered, ENPostFilterObj);
  try
    with frmENPostShow do
      begin
        //actView.Enabled := False;
        actInsert.Enabled := False;
        actDelete.Enabled := False;
        actEdit.Enabled := False;
        actUpdate.Enabled := False;
        actFilter.Enabled := False;
        actNoFilter.Enabled := False;
        if ShowModal = mrOk then
          if TAdvStringGrid(sgENPost).Cells[0, sgENPost.Row] <> '' then
            begin
              ENLineRouteObj.postRef.code := StrToInt(
                TAdvStringGrid(sgENPost).Cells[0, sgENPost.Row]);
              edtNextPostNumber.Text :=
                TAdvStringGrid(sgENPost).Cells[3, sgENPost.Row];
            end;
      end;
  finally
    frmENPostShow.Free;
  end;
end;

procedure TfrmENLineRouteEdit.spbLandscapeClick(Sender: TObject);
var frmENLandscapeShow: TfrmENLandscapeShow;
begin
  frmENLandscapeShow := TfrmENLandscapeShow.Create(Application, fmNormal);
  try
    with frmENLandscapeShow do
      if ShowModal = mrOk then
        begin
          try
            if ENLineRouteObj.landscapeRef = nil then
              ENLineRouteObj.landscapeRef := ENLandscapeRef.Create();
            ENLineRouteObj.landscapeRef.code :=
              StrToInt(GetReturnValue(sgENLandscape, 0));
            edtLandscape.Text := GetReturnValue(sgENLandscape, 1);
          except
            on EConvertError do Exit;
          end;
        end;
  finally
    frmENLandscapeShow.Free;
  end;
end;

end.