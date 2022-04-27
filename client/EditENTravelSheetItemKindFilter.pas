
unit EditENTravelSheetItemKindFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENTravelSheetItemKindController ;

type
  TfrmENTravelSheetItemKindFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENTravelSheetItemKind: THTTPRIO;

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
  frmENTravelSheetItemKindFilterEdit: TfrmENTravelSheetItemKindFilterEdit;
  ENTravelSheetItemKindFilterObj: ENTravelSheetItemKindFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENTravelSheetItemKindController  ;
}
{$R *.dfm}



procedure TfrmENTravelSheetItemKindFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENTravelSheetItemKindObj.name; 


  end;

}

end;



procedure TfrmENTravelSheetItemKindFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENTravelSheetItemKind: ENTravelSheetItemKindControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENTravelSheetItemKindFilterObj.name := edtName.Text; 




  end;
end;




end.