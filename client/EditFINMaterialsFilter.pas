
unit EditFINMaterialsFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, FINMaterialsController ;

type
  TfrmFINMaterialsFilterEdit = class(TDialogForm)

    lblMat_id : TLabel;
    edtMat_id: TEdit;
    lblNn : TLabel;
    edtNn: TEdit;
    lblMat_name : TLabel;
    edtMat_name: TEdit;
    lblMu_id : TLabel;
    edtMu_id: TEdit;
    lblMu_name : TLabel;
    edtMu_name: TEdit;
    lblDiv_code : TLabel;
    edtDiv_code: TEdit;
    lblDiv_name : TLabel;
    edtDiv_name: TEdit;
    lblParty_id : TLabel;
    edtParty_id: TEdit;
    lblDoc_num : TLabel;
    edtDoc_num: TEdit;
    lblPartner : TLabel;
    edtPartner: TEdit;
    lblPartner_name : TLabel;
    edtPartner_name: TEdit;
    lblDoc_date : TLabel;
    edtDoc_date: TDateTimePicker;
    lblParty_discription : TLabel;
    edtParty_discription: TEdit;
    lblRest_purpose_id : TLabel;
    edtRest_purpose_id: TEdit;
    lblRest_purpose_name : TLabel;
    edtRest_purpose_name: TEdit;
    lblRest_purpose_type_id : TLabel;
    edtRest_purpose_type_id: TEdit;
    lblBudget_core_id : TLabel;
    edtBudget_core_id: TEdit;
    lblFrc_code : TLabel;
    edtFrc_code: TEdit;
    lblFrc_name : TLabel;
    edtFrc_name: TEdit;
    lblCalc_price : TLabel;
    edtCalc_price: TEdit;
    lblQuantity : TLabel;
    edtQuantity: TEdit;
    lblPrice : TLabel;
    edtPrice: TEdit;
    lblCost : TLabel;
    edtCost: TEdit;
    lblBal_sch : TLabel;
    edtBal_sch: TEdit;
    lblFinDocItemCode : TLabel;
    edtFinDocItemCode: TEdit;


  HTTPRIOFINMaterials: THTTPRIO;

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
  frmFINMaterialsFilterEdit: TfrmFINMaterialsFilterEdit;
  FINMaterialsFilterObj: FINMaterialsFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, FINMaterialsController  ;
}
{$R *.dfm}



procedure TfrmFINMaterialsFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtMat_id
      ,edtNn
      ,edtMat_name
      ,edtMu_id
      ,edtMu_name
      ,edtDiv_code
      ,edtDiv_name
      ,edtParty_id
      ,edtDoc_num
      ,edtPartner
      ,edtDoc_date
      ,edtParty_discription
      ,edtCalc_price
      ,edtQuantity
      ,edtPrice
      ,edtCost
      ,edtFinDocItemCode
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    if ( FINMaterialsObj.mat_id <> Low(Integer) ) then
       edtMat_id.Text := IntToStr(FINMaterialsObj.mat_id)
    else
       edtMat_id.Text := '';



    edtNn.Text := FINMaterialsObj.nn; 



    edtMat_name.Text := FINMaterialsObj.mat_name; 



    if ( FINMaterialsObj.mu_id <> Low(Integer) ) then
       edtMu_id.Text := IntToStr(FINMaterialsObj.mu_id)
    else
       edtMu_id.Text := '';



    edtMu_name.Text := FINMaterialsObj.mu_name; 



    edtDiv_code.Text := FINMaterialsObj.div_code; 



    edtDiv_name.Text := FINMaterialsObj.div_name; 



    if ( FINMaterialsObj.party_id <> Low(Integer) ) then
       edtParty_id.Text := IntToStr(FINMaterialsObj.party_id)
    else
       edtParty_id.Text := '';



    edtDoc_num.Text := FINMaterialsObj.doc_num; 



    if ( FINMaterialsObj.partner <> Low(Integer) ) then
       edtPartner.Text := IntToStr(FINMaterialsObj.partner)
    else
       edtPartner.Text := '';



    edtPartner_name.Text := FINMaterialsObj.partner_name; 



      if FINMaterialsObj.doc_date <> nil then
      begin
        edtDoc_date.DateTime:=EncodeDate(FINMaterialsObj.doc_date.Year,FINMaterialsObj.doc_date.Month,FINMaterialsObj.doc_date.Day);
        edtDoc_date.checked := true;
      end
      else
      begin
        edtDoc_date.DateTime:=SysUtils.Date;
        edtDoc_date.checked := false;
      end;



    edtParty_discription.Text := FINMaterialsObj.party_discription; 



    if ( FINMaterialsObj.rest_purpose_id <> Low(Integer) ) then
       edtRest_purpose_id.Text := IntToStr(FINMaterialsObj.rest_purpose_id)
    else
       edtRest_purpose_id.Text := '';



    edtRest_purpose_name.Text := FINMaterialsObj.rest_purpose_name; 



    if ( FINMaterialsObj.rest_purpose_type_id <> Low(Integer) ) then
       edtRest_purpose_type_id.Text := IntToStr(FINMaterialsObj.rest_purpose_type_id)
    else
       edtRest_purpose_type_id.Text := '';



    if ( FINMaterialsObj.budget_core_id <> Low(Integer) ) then
       edtBudget_core_id.Text := IntToStr(FINMaterialsObj.budget_core_id)
    else
       edtBudget_core_id.Text := '';



    if ( FINMaterialsObj.frc_code <> Low(Integer) ) then
       edtFrc_code.Text := IntToStr(FINMaterialsObj.frc_code)
    else
       edtFrc_code.Text := '';



    edtFrc_name.Text := FINMaterialsObj.frc_name; 



    if ( FINMaterialsObj.calc_price <> nil ) then
       edtCalc_price.Text := FINMaterialsObj.calc_price.decimalString
    else
       edtCalc_price.Text := ''; 



    if ( FINMaterialsObj.quantity <> nil ) then
       edtQuantity.Text := FINMaterialsObj.quantity.decimalString
    else
       edtQuantity.Text := ''; 



    if ( FINMaterialsObj.price <> nil ) then
       edtPrice.Text := FINMaterialsObj.price.decimalString
    else
       edtPrice.Text := ''; 



    if ( FINMaterialsObj.cost <> nil ) then
       edtCost.Text := FINMaterialsObj.cost.decimalString
    else
       edtCost.Text := ''; 



    edtBal_sch.Text := FINMaterialsObj.bal_sch; 



    if ( FINMaterialsObj.finDocItemCode <> Low(Integer) ) then
       edtFinDocItemCode.Text := IntToStr(FINMaterialsObj.finDocItemCode)
    else
       edtFinDocItemCode.Text := '';


  end;

}

end;



procedure TfrmFINMaterialsFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempFINMaterials: FINMaterialsControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if ( edtMat_id.Text <> '' ) then
       FINMaterialsFilterObj.mat_id := StrToInt(edtMat_id.Text)
     else
       FINMaterialsFilterObj.mat_id := Low(Integer) ;




     FINMaterialsFilterObj.nn := edtNn.Text; 



     FINMaterialsFilterObj.mat_name := edtMat_name.Text; 



     if ( edtMu_id.Text <> '' ) then
       FINMaterialsFilterObj.mu_id := StrToInt(edtMu_id.Text)
     else
       FINMaterialsFilterObj.mu_id := Low(Integer) ;




     FINMaterialsFilterObj.mu_name := edtMu_name.Text; 



     FINMaterialsFilterObj.div_code := edtDiv_code.Text; 



     FINMaterialsFilterObj.div_name := edtDiv_name.Text; 



     if ( edtParty_id.Text <> '' ) then
       FINMaterialsFilterObj.party_id := StrToInt(edtParty_id.Text)
     else
       FINMaterialsFilterObj.party_id := Low(Integer) ;




     FINMaterialsFilterObj.doc_num := edtDoc_num.Text; 

     FINMaterialsFilterObj.partner := (edtPartner.Text) ;
     
     {
     if ( edtPartner.Text <> '' ) then
       FINMaterialsFilterObj.partner := StrToInt(edtPartner.Text)
     else
       FINMaterialsFilterObj.partner := Low(Integer) ;
     }



     FINMaterialsFilterObj.partner_name := edtPartner_name.Text;



     if FINMaterialsFilterObj.doc_date = nil then
        FINMaterialsFilterObj.doc_date := TXSDate.Create;
      FINMaterialsFilterObj.doc_date.XSToNative(GetXSDate(edtdoc_date.DateTime));




     FINMaterialsFilterObj.party_discription := edtParty_discription.Text; 



     if ( edtRest_purpose_id.Text <> '' ) then
       FINMaterialsFilterObj.rest_purpose_id := StrToInt(edtRest_purpose_id.Text)
     else
       FINMaterialsFilterObj.rest_purpose_id := Low(Integer) ;




     FINMaterialsFilterObj.rest_purpose_name := edtRest_purpose_name.Text; 



     if ( edtRest_purpose_type_id.Text <> '' ) then
       FINMaterialsFilterObj.rest_purpose_type_id := StrToInt(edtRest_purpose_type_id.Text)
     else
       FINMaterialsFilterObj.rest_purpose_type_id := Low(Integer) ;




     if ( edtBudget_core_id.Text <> '' ) then
       FINMaterialsFilterObj.budget_core_id := StrToInt(edtBudget_core_id.Text)
     else
       FINMaterialsFilterObj.budget_core_id := Low(Integer) ;




     if ( edtFrc_code.Text <> '' ) then
       FINMaterialsFilterObj.frc_code := StrToInt(edtFrc_code.Text)
     else
       FINMaterialsFilterObj.frc_code := Low(Integer) ;




     FINMaterialsFilterObj.frc_name := edtFrc_name.Text; 



     if (FINMaterialsFilterObj.calc_price = nil ) then
       FINMaterialsFilterObj.calc_price := TXSDecimal.Create;
     FINMaterialsFilterObj.calc_price.decimalString := edtCalc_price.Text ;



     if (FINMaterialsFilterObj.quantity = nil ) then
       FINMaterialsFilterObj.quantity := TXSDecimal.Create;
     FINMaterialsFilterObj.quantity.decimalString := edtQuantity.Text ;



     if (FINMaterialsFilterObj.price = nil ) then
       FINMaterialsFilterObj.price := TXSDecimal.Create;
     FINMaterialsFilterObj.price.decimalString := edtPrice.Text ;



     if (FINMaterialsFilterObj.cost = nil ) then
       FINMaterialsFilterObj.cost := TXSDecimal.Create;
     FINMaterialsFilterObj.cost.decimalString := edtCost.Text ;



     FINMaterialsFilterObj.bal_sch := edtBal_sch.Text; 



     if ( edtFinDocItemCode.Text <> '' ) then
       FINMaterialsFilterObj.finDocItemCode := StrToInt(edtFinDocItemCode.Text)
     else
       FINMaterialsFilterObj.finDocItemCode := Low(Integer) ;





  end;
end;




end.