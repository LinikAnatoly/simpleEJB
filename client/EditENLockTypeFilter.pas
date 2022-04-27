
unit EditENLockTypeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENLockTypeController ;

type
  TfrmENLockTypeFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENLockType: THTTPRIO;

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
  frmENLockTypeFilterEdit: TfrmENLockTypeFilterEdit;
  ENLockTypeFilterObj: ENLockTypeFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENLockTypeController  ;
}
{$R *.dfm}



procedure TfrmENLockTypeFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtName.Text := ENLockTypeObj.name; 


  end;

}

end;



procedure TfrmENLockTypeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENLockType: ENLockTypeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENLockTypeFilterObj.name := edtName.Text; 




  end;
end;




end.