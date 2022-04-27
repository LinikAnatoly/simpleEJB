
unit EditENOwnerFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENOwnerController ;

type
  TfrmENOwnerFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENOwner: THTTPRIO;

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
  frmENOwnerFilterEdit: TfrmENOwnerFilterEdit;
  ENOwnerFilterObj: ENOwnerFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENOwnerController  ;
}
{$R *.dfm}



procedure TfrmENOwnerFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENOwnerObj.name; 


  end;

}

end;



procedure TfrmENOwnerFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENOwner: ENOwnerControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENOwnerFilterObj.name := edtName.Text; 




  end;
end;




end.