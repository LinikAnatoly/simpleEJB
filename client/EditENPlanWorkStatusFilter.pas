
unit EditENPlanWorkStatusFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENPlanWorkStatusController ;

type
  TfrmENPlanWorkStatusFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENPlanWorkStatus: THTTPRIO;

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
  frmENPlanWorkStatusFilterEdit: TfrmENPlanWorkStatusFilterEdit;
  ENPlanWorkStatusFilterObj: ENPlanWorkStatusFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENPlanWorkStatusController  ;
}
{$R *.dfm}



procedure TfrmENPlanWorkStatusFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENPlanWorkStatusObj.name; 


  end;

}

end;



procedure TfrmENPlanWorkStatusFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENPlanWorkStatus: ENPlanWorkStatusControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENPlanWorkStatusFilterObj.name := edtName.Text; 




  end;
end;




end.