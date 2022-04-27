
unit EditENTravelSheetItemStatusFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENTravelSheetItemStatusController ;

type
  TfrmENTravelSheetItemStatusFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENTravelSheetItemStatus: THTTPRIO;

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
  frmENTravelSheetItemStatusFilterEdit: TfrmENTravelSheetItemStatusFilterEdit;
  ENTravelSheetItemStatusFilterObj: ENTravelSheetItemStatusFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENTravelSheetItemStatusController  ;
}
{$R *.dfm}



procedure TfrmENTravelSheetItemStatusFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENTravelSheetItemStatusObj.name; 


  end;

}

end;



procedure TfrmENTravelSheetItemStatusFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENTravelSheetItemStatus: ENTravelSheetItemStatusControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENTravelSheetItemStatusFilterObj.name := edtName.Text; 




  end;
end;




end.