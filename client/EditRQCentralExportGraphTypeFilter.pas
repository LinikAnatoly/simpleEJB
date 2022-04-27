
unit EditRQCentralExportGraphTypeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQCentralExportGraphTypeController ;

type
  TfrmRQCentralExportGraphTypeFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TMemo;



  HTTPRIORQCentralExportGraphType: THTTPRIO;

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
  frmRQCentralExportGraphTypeFilterEdit: TfrmRQCentralExportGraphTypeFilterEdit;
  RQCentralExportGraphTypeFilterObj: RQCentralExportGraphTypeFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, RQCentralExportGraphTypeController  ;
}
{$R *.dfm}



procedure TfrmRQCentralExportGraphTypeFilterEdit.FormShow(Sender: TObject);

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

    MakeMultiline(edtName.Lines, RQCentralExportGraphTypeObj.name);


  end;

}

end;



procedure TfrmRQCentralExportGraphTypeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQCentralExportGraphType: RQCentralExportGraphTypeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     RQCentralExportGraphTypeFilterObj.name := edtName.Text; 




  end;
end;




end.