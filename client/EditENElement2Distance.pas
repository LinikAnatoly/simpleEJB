unit EditENElement2Distance;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENElement2DistanceController ;

type
  TfrmENElement2DistanceEdit = class(TDialogForm)
    lblCode : TLabel;
    edtCode : TEdit;
    lblDistance : TLabel;
    edtDistance: TEdit;


    HTTPRIOENElement2Distance: THTTPRIO;

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
  frmENElement2DistanceEdit: TfrmENElement2DistanceEdit;
  ENElement2DistanceObj: ENElement2Distance;

implementation



{$R *.dfm}

procedure TfrmENElement2DistanceEdit.FormShow(Sender: TObject);
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
    ]);
  end;

  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtCode.Text := IntToStr(ENElement2DistanceObj.code);
    SetTXSDecimalForTEdit(edtDistance, ENElement2DistanceObj.distance);

  end;
end;



procedure TfrmENElement2DistanceEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENElement2Distance: ENElement2DistanceControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
     ]) then
  begin
    Application.MessageBox(PChar('Порожні поля неприпустимі!'), PChar('Увага!'), MB_ICONWARNING + MB_OK);
    Action := caNone;
  end
  else
  begin
    TempENElement2Distance := HTTPRIOENElement2Distance as ENElement2DistanceControllerSoapPort;

    ENElement2DistanceObj.distance := GetTXSDecimalFromTEdit(edtDistance);

    if DialogState = dsInsert then
    begin
      ENElement2DistanceObj.code := Low(Integer);
      TempENElement2Distance.add(ENElement2DistanceObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENElement2Distance.save(ENElement2DistanceObj);
    end;
  end;
end;


end.