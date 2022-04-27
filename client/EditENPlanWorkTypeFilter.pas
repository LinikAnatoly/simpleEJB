
unit EditENPlanWorkTypeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENPlanWorkTypeController ;

type
  TfrmENPlanWorkTypeFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENPlanWorkType: THTTPRIO;

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
  frmENPlanWorkTypeFilterEdit: TfrmENPlanWorkTypeFilterEdit;
  ENPlanWorkTypeFilterObj: ENPlanWorkTypeFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENPlanWorkTypeController  ;
}
{$R *.dfm}



procedure TfrmENPlanWorkTypeFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENPlanWorkTypeObj.name; 


  end;

}

end;



procedure TfrmENPlanWorkTypeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENPlanWorkType: ENPlanWorkTypeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENPlanWorkTypeFilterObj.name := edtName.Text; 




  end;
end;




end.