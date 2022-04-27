
unit EditENConsumerCategoryFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENConsumerCategoryController ;

type
  TfrmENConsumerCategoryFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENConsumerCategory: THTTPRIO;

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
  frmENConsumerCategoryFilterEdit: TfrmENConsumerCategoryFilterEdit;
  ENConsumerCategoryFilterObj: ENConsumerCategoryFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENConsumerCategoryController  ;
}
{$R *.dfm}



procedure TfrmENConsumerCategoryFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENConsumerCategoryObj.name; 


  end;

}

end;



procedure TfrmENConsumerCategoryFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENConsumerCategory: ENConsumerCategoryControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENConsumerCategoryFilterObj.name := edtName.Text; 




  end;
end;




end.