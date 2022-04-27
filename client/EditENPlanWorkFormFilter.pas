
unit EditENPlanWorkFormFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENPlanWorkFormController ;

type
  TfrmENPlanWorkFormFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENPlanWorkForm: THTTPRIO;

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
  frmENPlanWorkFormFilterEdit: TfrmENPlanWorkFormFilterEdit;
  ENPlanWorkFormFilterObj: ENPlanWorkFormFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENPlanWorkFormController  ;
}
{$R *.dfm}



procedure TfrmENPlanWorkFormFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENPlanWorkFormObj.name; 


  end;

}

end;



procedure TfrmENPlanWorkFormFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENPlanWorkForm: ENPlanWorkFormControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENPlanWorkFormFilterObj.name := edtName.Text; 




  end;
end;




end.