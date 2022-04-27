
unit EditENInvestProgramItem;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENInvestProgramItemController ;

type
  TfrmENInvestProgramItemEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;


  HTTPRIOENInvestProgramItem: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    lblName: TLabel;
    edtName: TEdit;
    gbNKRE: TGroupBox;
    lblCountGen: TLabel;
    lblPrice: TLabel;
    lblSumGen: TLabel;
    lblQuarter1count: TLabel;
    lblQuarter1sum: TLabel;
    lblQuarter2count: TLabel;
    lblQuarter2sum: TLabel;
    lblQuarter3count: TLabel;
    lblQuarter3sum: TLabel;
    lblQuarter4count: TLabel;
    lblQuarter4sum: TLabel;
    edtCountGen: TEdit;
    edtPrice: TEdit;
    edtSumGen: TEdit;
    edtQuarter1count: TEdit;
    edtQuarter1sum: TEdit;
    edtQuarter2count: TEdit;
    edtQuarter2sum: TEdit;
    edtQuarter3count: TEdit;
    edtQuarter3sum: TEdit;
    edtQuarter4count: TEdit;
    edtQuarter4sum: TEdit;
    lblCommentGen: TLabel;
    edtCommentGen: TMemo;
    Label1: TLabel;
    edtMaterialName: TEdit;
    spbMaterialName: TSpeedButton;
    lblMeasurement: TLabel;
    HTTPRIOTKMaterials: THTTPRIO;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbMaterialNameClick(Sender: TObject);
    procedure edtPriceChange(Sender: TObject);
  
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENInvestProgramItemEdit: TfrmENInvestProgramItemEdit;
  ENInvestProgramItemObj: ENInvestProgramItem;

implementation

uses ShowTKMaterials, TKMaterialsController, ENConsts;


{uses  
    EnergyproController, EnergyproController2, ENInvestProgramItemController  ;
}
{$R *.dfm}



procedure TfrmENInvestProgramItemEdit.FormShow(Sender: TObject);
var
  TempTKMaterials: TKMaterialsControllerSoapPort;
  material: TKMaterials;
begin
  DisableControls([edtMaterialName, edtCountGen, edtSumGen, edtQuarter1sum, edtQuarter2sum, edtQuarter3sum, edtQuarter4sum, edtCode]);

  SetFloatStyle([
      edtCountGen
      ,edtPrice
      ,edtSumGen
      ,edtQuarter1count
      ,edtQuarter1sum
      ,edtQuarter2count
      ,edtQuarter2sum
      ,edtQuarter3count
      ,edtQuarter3sum
      ,edtQuarter4count
      ,edtQuarter4sum
  ]);

  if DialogState = dsView then
  begin
    DisableControls([spbMaterialName]);

    edtPrice.OnChange := nil;
    edtQuarter1count.OnChange := nil;
    edtQuarter2count.OnChange := nil;
    edtQuarter3count.OnChange := nil;
    edtQuarter4count.OnChange := nil;
  end;

  if DialogState = dsEdit then
  begin
    DisableControls([spbMaterialName]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
      ,edtMaterialName
      ,edtCountGen
      ,edtPrice
      ,edtSumGen
      ,edtQuarter1count
      ,edtQuarter1sum
      ,edtQuarter2count
      ,edtQuarter2sum
      ,edtQuarter3count
      ,edtQuarter3sum
      ,edtQuarter4count
      ,edtQuarter4sum
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENInvestProgramItemObj.code);
    edtName.Text := ENInvestProgramItemObj.name;

    MakeMultiline(edtCommentGen.Lines, ENInvestProgramItemObj.commentGen);

    edtPrice.OnChange := nil;
    edtQuarter1count.OnChange := nil;
    edtQuarter2count.OnChange := nil;
    edtQuarter3count.OnChange := nil;
    edtQuarter4count.OnChange := nil;

    try
      if ( ENInvestProgramItemObj.countGen <> nil ) then
         edtCountGen.Text := ENInvestProgramItemObj.countGen.decimalString
      else
         edtCountGen.Text := '';
      if ( ENInvestProgramItemObj.price <> nil ) then
         edtPrice.Text := ENInvestProgramItemObj.price.decimalString
      else
         edtPrice.Text := '';
      if ( ENInvestProgramItemObj.sumGen <> nil ) then
         edtSumGen.Text := ENInvestProgramItemObj.sumGen.decimalString
      else
         edtSumGen.Text := '';
      if ( ENInvestProgramItemObj.quarter1count <> nil ) then
         edtQuarter1count.Text := ENInvestProgramItemObj.quarter1count.decimalString
      else
         edtQuarter1count.Text := '';
      if ( ENInvestProgramItemObj.quarter1sum <> nil ) then
         edtQuarter1sum.Text := ENInvestProgramItemObj.quarter1sum.decimalString
      else
         edtQuarter1sum.Text := '';
      if ( ENInvestProgramItemObj.quarter2count <> nil ) then
         edtQuarter2count.Text := ENInvestProgramItemObj.quarter2count.decimalString
      else
         edtQuarter2count.Text := '';
      if ( ENInvestProgramItemObj.quarter2sum <> nil ) then
         edtQuarter2sum.Text := ENInvestProgramItemObj.quarter2sum.decimalString
      else
         edtQuarter2sum.Text := '';
      if ( ENInvestProgramItemObj.quarter3count <> nil ) then
         edtQuarter3count.Text := ENInvestProgramItemObj.quarter3count.decimalString
      else
         edtQuarter3count.Text := '';
      if ( ENInvestProgramItemObj.quarter3sum <> nil ) then
         edtQuarter3sum.Text := ENInvestProgramItemObj.quarter3sum.decimalString
      else
         edtQuarter3sum.Text := '';
      if ( ENInvestProgramItemObj.quarter4count <> nil ) then
         edtQuarter4count.Text := ENInvestProgramItemObj.quarter4count.decimalString
      else
         edtQuarter4count.Text := '';
      if ( ENInvestProgramItemObj.quarter4sum <> nil ) then
         edtQuarter4sum.Text := ENInvestProgramItemObj.quarter4sum.decimalString
      else
         edtQuarter4sum.Text := '';
    finally
      edtPrice.OnChange := edtPriceChange;
      edtQuarter1count.OnChange := edtPriceChange;
      edtQuarter2count.OnChange := edtPriceChange;
      edtQuarter3count.OnChange := edtPriceChange;
      edtQuarter4count.OnChange := edtPriceChange;
    end;

    if ENInvestProgramItemObj.materialRef <> nil then
      if ENInvestProgramItemObj.materialRef.code > LOW_INT then
      begin
        TempTKMaterials := HTTPRIOTKMaterials as TKMaterialsControllerSoapPort;
        material := TempTKMaterials.getObject(ENInvestProgramItemObj.materialRef.code);
        if material <> nil then
          edtMaterialName.Text := material.name;
      end;

  end;
end;



procedure TfrmENInvestProgramItemEdit.spbMaterialNameClick(Sender: TObject);
var frmSpr_matherialShow: TfrmTKMaterialsShow;
//mtFilter : TKMaterialsFilter;
    price: Double;
begin
  if DialogState = dsView then Exit;

    frmSpr_matherialShow := TfrmTKMaterialsShow.Create(Application, fmNormal);//, mtFilter);

  try
    with frmSpr_matherialShow do
    begin
      DisableActions([actInsert, actEdit, actDelete]);

      DenyGroupSelection := true;

      if ShowModal = mrOk then
      begin
        try
          if ENInvestProgramItemObj.materialRef = nil then ENInvestProgramItemObj.materialRef := TKMaterialsRef.Create;
          ENInvestProgramItemObj.materialRef.code := TKMaterialsShort(tvDep.Selected.Data).code; //StrToInt(GetReturnValue(sgSpr_matherial, 0));
          edtMaterialName.Text := TKMaterialsShort(tvDep.Selected.Data).name; //GetReturnValue(sgSpr_matherial, 1);
          lblMeasurement.Caption := {'од.виміру : '+ }TKMaterialsShort(tvDep.Selected.Data).measurementName ;//GetReturnValue(sgSpr_matherial, 2);

          if TKMaterialsShort(tvDep.Selected.Data).cost <> nil then
          begin
            try
              price := StrToFloat(TKMaterialsShort(tvDep.Selected.Data).cost.DecimalString);
            except
              on EConvertError do
                price := 0;
            end;

            price := Conv(price / 1000, 3);

            //edtPrice.Text := TKMaterialsShort(tvDep.Selected.Data).cost.DecimalString;
            edtPrice.Text := FloatToStr(price);
          end;

          if edtName.Text = '' then
            edtName.Text := edtMaterialName.Text;
        except
          on EConvertError do Exit;
        end;
      end;
    end;
  finally
    frmSpr_matherialShow.Free;
  end;
end;

procedure TfrmENInvestProgramItemEdit.edtPriceChange(Sender: TObject);
var price, count,
    countQ1, countQ2, countQ3, countQ4: Double;
begin
  try
    price := StrToFloat(edtPrice.Text);
  except
    on EConvertError do
      price := 0;
  end;

  {
  try
    count := StrToFloat(edtCountGen.Text);
  except
    on EConvertError do
      count := 0;
  end;
  }

  try
    countQ1 := StrToFloat(edtQuarter1count.Text);
  except
    on EConvertError do
      countQ1 := 0;
  end;

  try
    countQ2 := StrToFloat(edtQuarter2count.Text);
  except
    on EConvertError do
      countQ2 := 0;
  end;

  try
    countQ3 := StrToFloat(edtQuarter3count.Text);
  except
    on EConvertError do
      countQ3 := 0;
  end;

  try
    countQ4 := StrToFloat(edtQuarter4count.Text);
  except
    on EConvertError do
      countQ4 := 0;
  end;

  edtQuarter1sum.Text := FloatToStr(Conv(price * countQ1, 3));
  edtQuarter2sum.Text := FloatToStr(Conv(price * countQ2, 3));
  edtQuarter3sum.Text := FloatToStr(Conv(price * countQ3, 3));
  edtQuarter4sum.Text := FloatToStr(Conv(price * countQ4, 3));

  count := Conv(Conv(countQ1, 6) + Conv(countQ2, 6) +
                Conv(countQ3, 6) + Conv(countQ4, 6), 6);

  edtCountGen.Text := FloatToStr(count);

  //edtSumGen.Text := FloatToStrF(price * count, ffFixed, 15, 2);
  edtSumGen.Text := FloatToStr(Conv(price * count, 3));
end;

procedure TfrmENInvestProgramItemEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENInvestProgramItem: ENInvestProgramItemControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      //edtName
      edtMaterialName
      ,edtPrice
      ,edtCountGen
      ,edtSumGen
      ,edtQuarter1count
      ,edtQuarter1sum
      ,edtQuarter2count
      ,edtQuarter2sum
      ,edtQuarter3count
      ,edtQuarter3sum
      ,edtQuarter4count
      ,edtQuarter4sum
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENInvestProgramItem := HTTPRIOENInvestProgramItem as ENInvestProgramItemControllerSoapPort;

     ENInvestProgramItemObj.name := edtName.Text;

     if ENInvestProgramItemObj.name = '' then
       ENInvestProgramItemObj.name := edtMaterialName.Text;

     ENInvestProgramItemObj.commentGen := edtCommentGen.Text; 

     if (ENInvestProgramItemObj.countGen = nil ) then
       ENInvestProgramItemObj.countGen := TXSDecimal.Create;
     if edtCountGen.Text <> '' then
       ENInvestProgramItemObj.countGen.decimalString := edtCountGen.Text 
     else
       ENInvestProgramItemObj.countGen := nil;

     if (ENInvestProgramItemObj.price = nil ) then
       ENInvestProgramItemObj.price := TXSDecimal.Create;
     if edtPrice.Text <> '' then
       ENInvestProgramItemObj.price.decimalString := edtPrice.Text 
     else
       ENInvestProgramItemObj.price := nil;

     if (ENInvestProgramItemObj.sumGen = nil ) then
       ENInvestProgramItemObj.sumGen := TXSDecimal.Create;
     if edtSumGen.Text <> '' then
       ENInvestProgramItemObj.sumGen.decimalString := edtSumGen.Text 
     else
       ENInvestProgramItemObj.sumGen := nil;

     if (ENInvestProgramItemObj.quarter1count = nil ) then
       ENInvestProgramItemObj.quarter1count := TXSDecimal.Create;
     if edtQuarter1count.Text <> '' then
       ENInvestProgramItemObj.quarter1count.decimalString := edtQuarter1count.Text 
     else
       ENInvestProgramItemObj.quarter1count := nil;

     if (ENInvestProgramItemObj.quarter1sum = nil ) then
       ENInvestProgramItemObj.quarter1sum := TXSDecimal.Create;
     if edtQuarter1sum.Text <> '' then
       ENInvestProgramItemObj.quarter1sum.decimalString := edtQuarter1sum.Text 
     else
       ENInvestProgramItemObj.quarter1sum := nil;

     if (ENInvestProgramItemObj.quarter2count = nil ) then
       ENInvestProgramItemObj.quarter2count := TXSDecimal.Create;
     if edtQuarter2count.Text <> '' then
       ENInvestProgramItemObj.quarter2count.decimalString := edtQuarter2count.Text 
     else
       ENInvestProgramItemObj.quarter2count := nil;

     if (ENInvestProgramItemObj.quarter2sum = nil ) then
       ENInvestProgramItemObj.quarter2sum := TXSDecimal.Create;
     if edtQuarter2sum.Text <> '' then
       ENInvestProgramItemObj.quarter2sum.decimalString := edtQuarter2sum.Text 
     else
       ENInvestProgramItemObj.quarter2sum := nil;

     if (ENInvestProgramItemObj.quarter3count = nil ) then
       ENInvestProgramItemObj.quarter3count := TXSDecimal.Create;
     if edtQuarter3count.Text <> '' then
       ENInvestProgramItemObj.quarter3count.decimalString := edtQuarter3count.Text 
     else
       ENInvestProgramItemObj.quarter3count := nil;

     if (ENInvestProgramItemObj.quarter3sum = nil ) then
       ENInvestProgramItemObj.quarter3sum := TXSDecimal.Create;
     if edtQuarter3sum.Text <> '' then
       ENInvestProgramItemObj.quarter3sum.decimalString := edtQuarter3sum.Text 
     else
       ENInvestProgramItemObj.quarter3sum := nil;

     if (ENInvestProgramItemObj.quarter4count = nil ) then
       ENInvestProgramItemObj.quarter4count := TXSDecimal.Create;
     if edtQuarter4count.Text <> '' then
       ENInvestProgramItemObj.quarter4count.decimalString := edtQuarter4count.Text 
     else
       ENInvestProgramItemObj.quarter4count := nil;

     if (ENInvestProgramItemObj.quarter4sum = nil ) then
       ENInvestProgramItemObj.quarter4sum := TXSDecimal.Create;
     if edtQuarter4sum.Text <> '' then
       ENInvestProgramItemObj.quarter4sum.decimalString := edtQuarter4sum.Text 
     else
       ENInvestProgramItemObj.quarter4sum := nil;

    if DialogState = dsInsert then
    begin
      ENInvestProgramItemObj.code:=low(Integer);
      TempENInvestProgramItem.add(ENInvestProgramItemObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENInvestProgramItem.save(ENInvestProgramItemObj);
    end;
  end;
end;


end.