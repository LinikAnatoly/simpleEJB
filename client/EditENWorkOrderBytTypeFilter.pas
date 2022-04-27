
unit EditENWorkOrderBytTypeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENWorkOrderBytTypeController ;

type
  TfrmENWorkOrderBytTypeFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENWorkOrderBytType: THTTPRIO;

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
  frmENWorkOrderBytTypeFilterEdit: TfrmENWorkOrderBytTypeFilterEdit;
  ENWorkOrderBytTypeFilterObj: ENWorkOrderBytTypeFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENWorkOrderBytTypeController  ;
}
{$R *.dfm}



procedure TfrmENWorkOrderBytTypeFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENWorkOrderBytTypeObj.name; 


  end;

}

end;



procedure TfrmENWorkOrderBytTypeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENWorkOrderBytType: ENWorkOrderBytTypeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENWorkOrderBytTypeFilterObj.name := edtName.Text; 




  end;
end;




end.