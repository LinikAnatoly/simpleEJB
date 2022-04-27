
unit EditENSOValuesTypeCategoryFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENSOValuesTypeCategoryController ;

type
  TfrmENSOValuesTypeCategoryFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENSOValuesTypeCategory: THTTPRIO;

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
  frmENSOValuesTypeCategoryFilterEdit: TfrmENSOValuesTypeCategoryFilterEdit;
  ENSOValuesTypeCategoryFilterObj: ENSOValuesTypeCategoryFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENSOValuesTypeCategoryController  ;
}
{$R *.dfm}



procedure TfrmENSOValuesTypeCategoryFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENSOValuesTypeCategoryObj.name; 


  end;

}

end;



procedure TfrmENSOValuesTypeCategoryFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSOValuesTypeCategory: ENSOValuesTypeCategoryControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENSOValuesTypeCategoryFilterObj.name := edtName.Text; 




  end;
end;




end.