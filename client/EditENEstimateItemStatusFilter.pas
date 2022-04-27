
unit EditENEstimateItemStatusFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENEstimateItemStatusController ;

type
  TfrmENEstimateItemStatusFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENEstimateItemStatus: THTTPRIO;

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
  frmENEstimateItemStatusFilterEdit: TfrmENEstimateItemStatusFilterEdit;
  ENEstimateItemStatusFilterObj: ENEstimateItemStatusFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENEstimateItemStatusController  ;
}
{$R *.dfm}



procedure TfrmENEstimateItemStatusFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENEstimateItemStatusObj.name; 


  end;

}

end;



procedure TfrmENEstimateItemStatusFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENEstimateItemStatus: ENEstimateItemStatusControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENEstimateItemStatusFilterObj.name := edtName.Text; 




  end;
end;




end.