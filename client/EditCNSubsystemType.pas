
unit EditCNSubsystemType;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, CNSubsystemTypeController ;

type
  TfrmCNSubsystemTypeEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOCNSubsystemType: THTTPRIO;

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
  frmCNSubsystemTypeEdit: TfrmCNSubsystemTypeEdit;
  CNSubsystemTypeObj: CNSubsystemType;

implementation


{uses  
    EnergyproController, EnergyproController2, CNSubsystemTypeController  ;
}
{$R *.dfm}



procedure TfrmCNSubsystemTypeEdit.FormShow(Sender: TObject);

begin
  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtName.Text := CNSubsystemTypeObj.name; 


  end;
end;



procedure TfrmCNSubsystemTypeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempCNSubsystemType: CNSubsystemTypeControllerSoapPort;
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
    TempCNSubsystemType := HTTPRIOCNSubsystemType as CNSubsystemTypeControllerSoapPort;


     CNSubsystemTypeObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      CNSubsystemTypeObj.code:=low(Integer);
      TempCNSubsystemType.add(CNSubsystemTypeObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempCNSubsystemType.save(CNSubsystemTypeObj);
    end;
  end;
end;


end.