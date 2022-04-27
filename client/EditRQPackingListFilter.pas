
unit EditRQPackingListFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQPackingListController ;

type
  TfrmRQPackingListFilterEdit = class(TDialogForm)

    lblNumberGen : TLabel;
    edtNumberGen: TEdit;

    lblDateGen : TLabel;
    lblMolFromCode : TLabel;
    edtMolFromCode: TEdit;

    lblMolFromName : TLabel;
    edtMolFromName: TEdit;

    lblMolToCode : TLabel;
    edtMolToCode: TEdit;

    lblMolToName : TLabel;
    edtMolToName: TEdit;


  HTTPRIORQPackingList: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    edtDateGenFrom: TDateTimePicker;
    edtDateGenTo: TDateTimePicker;
    Label2: TLabel;
    Label1: TLabel;
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmRQPackingListFilterEdit: TfrmRQPackingListFilterEdit;
  RQPackingListFilterObj: RQPackingListFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, RQPackingListController  ;
}
{$R *.dfm}



procedure TfrmRQPackingListFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQPackingList: RQPackingListControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     RQPackingListFilterObj.numberGen := edtNumberGen.Text;



     if edtDateGenFrom.checked then
     begin
       RQPackingListFilterObj.conditionSQL := RQPackingListFilterObj.conditionSQL + ' RQPACKINGLIST.DATEGEN >= to_date(''' + DateToStr(edtDateGenFrom.Date) + ''', ''dd.MM.yyyy'')';
     end;

     if edtDateGenTo.checked then
     begin
       RQPackingListFilterObj.conditionSQL := RQPackingListFilterObj.conditionSQL + ' AND RQPACKINGLIST.DATEGEN <= to_date(''' + DateToStr(edtDateGenTo.Date) + ''', ''dd.MM.yyyy'')';
     end;



     RQPackingListFilterObj.molFromCode := edtMolFromCode.Text; 



     RQPackingListFilterObj.molFromName := edtMolFromName.Text; 



     RQPackingListFilterObj.molToCode := edtMolToCode.Text; 



     RQPackingListFilterObj.molToName := edtMolToName.Text;

  end;
end;




end.