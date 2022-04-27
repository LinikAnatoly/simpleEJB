
unit EditENConnectionCityTypeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENConnectionCityTypeController ;

type
  TfrmENConnectionCityTypeFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENConnectionCityType: THTTPRIO;

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
  frmENConnectionCityTypeFilterEdit: TfrmENConnectionCityTypeFilterEdit;
  ENConnectionCityTypeFilterObj: ENConnectionCityTypeFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENConnectionCityTypeController  ;
}
{$R *.dfm}



procedure TfrmENConnectionCityTypeFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENConnectionCityTypeObj.name; 


  end;

}

end;



procedure TfrmENConnectionCityTypeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENConnectionCityType: ENConnectionCityTypeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENConnectionCityTypeFilterObj.name := edtName.Text; 




  end;
end;




end.