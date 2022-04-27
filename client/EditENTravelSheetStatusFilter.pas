
unit EditENTravelSheetStatusFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENTravelSheetStatusController ;

type
  TfrmENTravelSheetStatusFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENTravelSheetStatus: THTTPRIO;

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
  frmENTravelSheetStatusFilterEdit: TfrmENTravelSheetStatusFilterEdit;
  ENTravelSheetStatusFilterObj: ENTravelSheetStatusFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENTravelSheetStatusController  ;
}
{$R *.dfm}



procedure TfrmENTravelSheetStatusFilterEdit.FormShow(Sender: TObject);

begin

{ ���� ���� �� ������ ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtName.Text := ENTravelSheetStatusObj.name; 


  end;

}

end;



procedure TfrmENTravelSheetStatusFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENTravelSheetStatus: ENTravelSheetStatusControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENTravelSheetStatusFilterObj.name := edtName.Text; 




  end;
end;




end.