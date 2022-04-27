
unit EditRQFKOrderItemFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQFKOrderItemController ;

type
  TfrmRQFKOrderItemFilterEdit = class(TDialogForm)

    lblFinCode : TLabel;
    edtFinCode: TEdit;

    lblNomenclatureCode : TLabel;
    edtNomenclatureCode: TEdit;

    lblNomenclatureNum : TLabel;
    edtNomenclatureNum: TEdit;

    lblNomenclatureBalSch : TLabel;
    edtNomenclatureBalSch: TEdit;

    lblNomenclatureName : TLabel;
    edtNomenclatureName: TMemo;

    lblNomenclatureUnitCode : TLabel;
    edtNomenclatureUnitCode: TEdit;

    lblNomenclatureUnitName : TLabel;
    edtNomenclatureUnitName: TEdit;

    lblCountGen : TLabel;
    edtCountGen: TEdit;

    lblPrice : TLabel;
    edtPrice: TEdit;

    lblSumGen : TLabel;
    edtSumGen: TEdit;

    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;
    lblUserGen : TLabel;
    edtUserGen: TEdit;


  lblTKMaterialsMaterialName : TLabel;
  edtTKMaterialsMaterialName : TEdit;
  spbTKMaterialsMaterial : TSpeedButton;
  

  HTTPRIORQFKOrderItem: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbTKMaterialsMaterialClick(Sender : TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmRQFKOrderItemFilterEdit: TfrmRQFKOrderItemFilterEdit;
  RQFKOrderItemFilterObj: RQFKOrderItemFilter;

implementation

uses
  ShowTKMaterials
  ,TKMaterialsController
;

{uses  
    EnergyproController, EnergyproController2, RQFKOrderItemController  ;
}
{$R *.dfm}



procedure TfrmRQFKOrderItemFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtCountGen
      ,edtPrice
      ,edtSumGen
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    if ( RQFKOrderItemObj.finCode <> Low(Integer) ) then
       edtFinCode.Text := IntToStr(RQFKOrderItemObj.finCode)
    else
       edtFinCode.Text := '';



    if ( RQFKOrderItemObj.nomenclatureCode <> Low(Integer) ) then
       edtNomenclatureCode.Text := IntToStr(RQFKOrderItemObj.nomenclatureCode)
    else
       edtNomenclatureCode.Text := '';



    edtNomenclatureNum.Text := RQFKOrderItemObj.nomenclatureNum; 



    edtNomenclatureBalSch.Text := RQFKOrderItemObj.nomenclatureBalSch; 



    MakeMultiline(edtNomenclatureName.Lines, RQFKOrderItemObj.nomenclatureName);



    if ( RQFKOrderItemObj.nomenclatureUnitCode <> Low(Integer) ) then
       edtNomenclatureUnitCode.Text := IntToStr(RQFKOrderItemObj.nomenclatureUnitCode)
    else
       edtNomenclatureUnitCode.Text := '';



    edtNomenclatureUnitName.Text := RQFKOrderItemObj.nomenclatureUnitName; 



    if ( RQFKOrderItemObj.countGen <> nil ) then
       edtCountGen.Text := RQFKOrderItemObj.countGen.decimalString
    else
       edtCountGen.Text := ''; 



    if ( RQFKOrderItemObj.price <> nil ) then
       edtPrice.Text := RQFKOrderItemObj.price.decimalString
    else
       edtPrice.Text := ''; 



    if ( RQFKOrderItemObj.sumGen <> nil ) then
       edtSumGen.Text := RQFKOrderItemObj.sumGen.decimalString
    else
       edtSumGen.Text := ''; 



      if RQFKOrderItemObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(RQFKOrderItemObj.dateEdit.Year,RQFKOrderItemObj.dateEdit.Month,RQFKOrderItemObj.dateEdit.Day);
        edtDateEdit.checked := true;
      end
      else
      begin
        edtDateEdit.DateTime:=SysUtils.Date;
        edtDateEdit.checked := false;
      end;



    edtUserGen.Text := RQFKOrderItemObj.userGen; 


  end;

}

end;



procedure TfrmRQFKOrderItemFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQFKOrderItem: RQFKOrderItemControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if ( edtFinCode.Text <> '' ) then
       RQFKOrderItemFilterObj.finCode := StrToInt(edtFinCode.Text)
     else
       RQFKOrderItemFilterObj.finCode := Low(Integer) ;




     if ( edtNomenclatureCode.Text <> '' ) then
       RQFKOrderItemFilterObj.nomenclatureCode := StrToInt(edtNomenclatureCode.Text)
     else
       RQFKOrderItemFilterObj.nomenclatureCode := Low(Integer) ;




     RQFKOrderItemFilterObj.nomenclatureNum := edtNomenclatureNum.Text; 



     RQFKOrderItemFilterObj.nomenclatureBalSch := edtNomenclatureBalSch.Text; 



     RQFKOrderItemFilterObj.nomenclatureName := edtNomenclatureName.Text; 



     if ( edtNomenclatureUnitCode.Text <> '' ) then
       RQFKOrderItemFilterObj.nomenclatureUnitCode := StrToInt(edtNomenclatureUnitCode.Text)
     else
       RQFKOrderItemFilterObj.nomenclatureUnitCode := Low(Integer) ;




     RQFKOrderItemFilterObj.nomenclatureUnitName := edtNomenclatureUnitName.Text; 



     if (RQFKOrderItemFilterObj.countGen = nil ) then
       RQFKOrderItemFilterObj.countGen := TXSDecimal.Create;
     if edtCountGen.Text <> '' then
       RQFKOrderItemFilterObj.countGen.decimalString := edtCountGen.Text 
     else
       RQFKOrderItemFilterObj.countGen := nil;







     if (RQFKOrderItemFilterObj.sumGen = nil ) then
       RQFKOrderItemFilterObj.sumGen := TXSDecimal.Create;
     if edtSumGen.Text <> '' then
       RQFKOrderItemFilterObj.sumGen.decimalString := edtSumGen.Text 
     else
       RQFKOrderItemFilterObj.sumGen := nil;




     if edtdateEdit.checked then
     begin 
       if RQFKOrderItemFilterObj.dateEdit = nil then
          RQFKOrderItemFilterObj.dateEdit := TXSDate.Create;
       RQFKOrderItemFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       RQFKOrderItemFilterObj.dateEdit := nil;




     RQFKOrderItemFilterObj.userGen := edtUserGen.Text; 




  end;
end;

procedure TfrmRQFKOrderItemFilterEdit.spbTKMaterialsMaterialClick(Sender : TObject);
var 
   frmTKMaterialsShow: TfrmTKMaterialsShow;
begin
   frmTKMaterialsShow:=TfrmTKMaterialsShow.Create(Application,fmNormal);
   try
      with frmTKMaterialsShow do
        if ShowModal = mrOk then
        begin
            try
               //if RQFKOrderItemFilterObj.material = nil then RQFKOrderItemFilterObj.material := TKMaterials.Create();
               //RQFKOrderItemFilterObj.material.code := StrToInt(GetReturnValue(sgTKMaterials,0));
               //edtTKMaterialsMaterialName.Text:=GetReturnValue(sgTKMaterials,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmTKMaterialsShow.Free;
   end;
end;





end.