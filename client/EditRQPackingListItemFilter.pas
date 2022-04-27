
unit EditRQPackingListItemFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQPackingListItemController ;

type
  TfrmRQPackingListItemFilterEdit = class(TDialogForm)

    lblMaterialName : TLabel;
    edtMaterialName: TEdit;

    lblNn : TLabel;
    edtNn: TEdit;

    lblMeasurementName : TLabel;
    edtMeasurementName: TEdit;

    lblCountGen : TLabel;
    edtCountGen: TEdit;

    lblEstimateItemString : TLabel;
    edtEstimateItemString: TMemo;

    lblUserGen : TLabel;
    edtUserGen: TEdit;

    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;


  HTTPRIORQPackingListItem: THTTPRIO;

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
  frmRQPackingListItemFilterEdit: TfrmRQPackingListItemFilterEdit;
  RQPackingListItemFilterObj: RQPackingListItemFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, RQPackingListItemController  ;
}
{$R *.dfm}



procedure TfrmRQPackingListItemFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtMaterialName
      ,edtCountGen
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtMaterialName.Text := RQPackingListItemObj.materialName; 



    edtNn.Text := RQPackingListItemObj.nn; 



    edtMeasurementName.Text := RQPackingListItemObj.measurementName; 



    if ( RQPackingListItemObj.countGen <> nil ) then
       edtCountGen.Text := RQPackingListItemObj.countGen.decimalString
    else
       edtCountGen.Text := ''; 



    MakeMultiline(edtEstimateItemString.Lines, RQPackingListItemObj.estimateItemString);



    edtUserGen.Text := RQPackingListItemObj.userGen; 



      if RQPackingListItemObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(RQPackingListItemObj.dateEdit.Year,RQPackingListItemObj.dateEdit.Month,RQPackingListItemObj.dateEdit.Day);
        edtDateEdit.checked := true;
      end
      else
      begin
        edtDateEdit.DateTime:=SysUtils.Date;
        edtDateEdit.checked := false;
      end;


  end;

}

end;



procedure TfrmRQPackingListItemFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQPackingListItem: RQPackingListItemControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     RQPackingListItemFilterObj.materialName := edtMaterialName.Text; 



     RQPackingListItemFilterObj.nn := edtNn.Text; 



     RQPackingListItemFilterObj.measurementName := edtMeasurementName.Text; 



     if (RQPackingListItemFilterObj.countGen = nil ) then
       RQPackingListItemFilterObj.countGen := TXSDecimal.Create;
     if edtCountGen.Text <> '' then
       RQPackingListItemFilterObj.countGen.decimalString := edtCountGen.Text 
     else
       RQPackingListItemFilterObj.countGen := nil;




     RQPackingListItemFilterObj.estimateItemString := edtEstimateItemString.Text; 



     RQPackingListItemFilterObj.userGen := edtUserGen.Text; 



     if edtdateEdit.checked then
     begin 
       if RQPackingListItemFilterObj.dateEdit = nil then
          RQPackingListItemFilterObj.dateEdit := TXSDate.Create;
       RQPackingListItemFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       RQPackingListItemFilterObj.dateEdit := nil;




  end;
end;




end.