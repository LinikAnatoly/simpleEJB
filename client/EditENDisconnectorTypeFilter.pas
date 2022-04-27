
unit EditENDisconnectorTypeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENDisconnectorTypeController ;

type
  TfrmENDisconnectorTypeFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENDisconnectorType: THTTPRIO;

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
  frmENDisconnectorTypeFilterEdit: TfrmENDisconnectorTypeFilterEdit;
  ENDisconnectorTypeFilterObj: ENDisconnectorTypeFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENDisconnectorTypeController  ;
}
{$R *.dfm}



procedure TfrmENDisconnectorTypeFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENDisconnectorTypeObj.name; 


  end;

}

end;



procedure TfrmENDisconnectorTypeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENDisconnectorType: ENDisconnectorTypeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENDisconnectorTypeFilterObj.name := edtName.Text; 




  end;
end;




end.