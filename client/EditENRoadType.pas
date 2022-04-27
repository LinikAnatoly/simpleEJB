
unit EditENRoadType;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENRoadTypeController ;

type
  TfrmENRoadTypeEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENRoadType: THTTPRIO;

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
  frmENRoadTypeEdit: TfrmENRoadTypeEdit;
  ENRoadTypeObj: ENRoadType;

implementation


{uses  
    EnergyproController, EnergyproController2, ENRoadTypeController  ;
}
{$R *.dfm}



procedure TfrmENRoadTypeEdit.FormShow(Sender: TObject);

begin
  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtName.Text := ENRoadTypeObj.name; 


  end;
end;



procedure TfrmENRoadTypeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENRoadType: ENRoadTypeControllerSoapPort;
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
    TempENRoadType := HTTPRIOENRoadType as ENRoadTypeControllerSoapPort;


     ENRoadTypeObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENRoadTypeObj.code:=low(Integer);
      TempENRoadType.add(ENRoadTypeObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENRoadType.save(ENRoadTypeObj);
    end;
  end;
end;


end.