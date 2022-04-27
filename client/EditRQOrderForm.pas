
unit EditRQOrderForm;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQOrderFormController ;

type
  TfrmRQOrderFormEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;


  HTTPRIORQOrderForm: THTTPRIO;

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
  frmRQOrderFormEdit: TfrmRQOrderFormEdit;
  RQOrderFormObj: RQOrderForm;

implementation


{uses  
    EnergyproController, EnergyproController2, RQOrderFormController  ;
}
{$R *.dfm}



procedure TfrmRQOrderFormEdit.FormShow(Sender: TObject);

begin
  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtName.Text := RQOrderFormObj.name; 


  end;
end;



procedure TfrmRQOrderFormEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQOrderForm: RQOrderFormControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtName
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempRQOrderForm := HTTPRIORQOrderForm as RQOrderFormControllerSoapPort;


     RQOrderFormObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      RQOrderFormObj.code:=low(Integer);
      TempRQOrderForm.add(RQOrderFormObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempRQOrderForm.save(RQOrderFormObj);
    end;
  end;
end;


end.