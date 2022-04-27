unit EditENActInvestType2DFDoc;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENActInvestType2DFDocController ;

type
  TfrmENActInvestType2DFDocEdit = class(TDialogForm)
    lblCode : TLabel;
    edtCode : TEdit;
    lblName : TLabel;
    edtName: TMemo;


    HTTPRIOENActInvestType2DFDoc: THTTPRIO;

    btnOk: TButton;
    btnCancel: TButton;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmENActInvestType2DFDocEdit: TfrmENActInvestType2DFDocEdit;
  ENActInvestType2DFDocObj: ENActInvestType2DFDoc;

implementation



{$R *.dfm}

procedure TfrmENActInvestType2DFDocEdit.FormShow(Sender: TObject);
begin
  DisableControls([edtCode]);

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) then
  begin
    HideControls([lblCode, edtCode]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin    
    DenyBlankValues([
      edtName
    ]);
  end;

  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtCode.Text := IntToStr(ENActInvestType2DFDocObj.code);
    MakeMultiline(edtName.Lines, ENActInvestType2DFDocObj.name);

  end;
end;



procedure TfrmENActInvestType2DFDocEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENActInvestType2DFDoc: ENActInvestType2DFDocControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtName
     ]) then
  begin
    Application.MessageBox(PChar('Порожні поля неприпустимі!'), PChar('Увага!'), MB_ICONWARNING + MB_OK);
    Action := caNone;
  end
  else
  begin
    TempENActInvestType2DFDoc := HTTPRIOENActInvestType2DFDoc as ENActInvestType2DFDocControllerSoapPort;

    ENActInvestType2DFDocObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENActInvestType2DFDocObj.code := Low(Integer);
      TempENActInvestType2DFDoc.add(ENActInvestType2DFDocObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENActInvestType2DFDoc.save(ENActInvestType2DFDocObj);
    end;
  end;
end;


end.