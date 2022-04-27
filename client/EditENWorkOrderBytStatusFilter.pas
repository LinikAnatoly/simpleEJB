
unit EditENWorkOrderBytStatusFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENWorkOrderBytStatusController ;

type
  TfrmENWorkOrderBytStatusFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENWorkOrderBytStatus: THTTPRIO;

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
  frmENWorkOrderBytStatusFilterEdit: TfrmENWorkOrderBytStatusFilterEdit;
  ENWorkOrderBytStatusFilterObj: ENWorkOrderBytStatusFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENWorkOrderBytStatusController  ;
}
{$R *.dfm}



procedure TfrmENWorkOrderBytStatusFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENWorkOrderBytStatusObj.name; 


  end;

}

end;



procedure TfrmENWorkOrderBytStatusFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENWorkOrderBytStatus: ENWorkOrderBytStatusControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENWorkOrderBytStatusFilterObj.name := edtName.Text; 




  end;
end;




end.