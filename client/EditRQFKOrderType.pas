unit EditRQFKOrderType;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, RQFKOrderTypeController ;

type
  TfrmRQFKOrderTypeEdit = class(TDialogForm)
    lblCode : TLabel;
    edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;
    lblTxtGen : TLabel;
    edtTxtGen: TEdit;


    HTTPRIORQFKOrderType: THTTPRIO;

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
  frmRQFKOrderTypeEdit: TfrmRQFKOrderTypeEdit;
  RQFKOrderTypeObj: RQFKOrderType;

implementation



{$R *.dfm}

procedure TfrmRQFKOrderTypeEdit.FormShow(Sender: TObject);
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
      ,edtTxtGen
    ]);
  end;

  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtCode.Text := IntToStr(RQFKOrderTypeObj.code);
    edtName.Text := RQFKOrderTypeObj.name; 
    edtTxtGen.Text := RQFKOrderTypeObj.txtGen; 

  end;
end;



procedure TfrmRQFKOrderTypeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQFKOrderType: RQFKOrderTypeControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtName
      ,edtTxtGen
     ]) then
  begin
    Application.MessageBox(PChar('Порожні поля неприпустимі!'), PChar('Увага!'), MB_ICONWARNING + MB_OK);
    Action := caNone;
  end
  else
  begin
    TempRQFKOrderType := HTTPRIORQFKOrderType as RQFKOrderTypeControllerSoapPort;

    RQFKOrderTypeObj.name := edtName.Text; 
    RQFKOrderTypeObj.txtGen := edtTxtGen.Text; 

    if DialogState = dsInsert then
    begin
      RQFKOrderTypeObj.code := Low(Integer);
      TempRQFKOrderType.add(RQFKOrderTypeObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempRQFKOrderType.save(RQFKOrderTypeObj);
    end;
  end;
end;


end.