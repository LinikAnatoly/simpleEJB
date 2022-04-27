
unit EditRQBillItem;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	  EnergyproController, EnergyproController2, RQBillItemController, RQBillController,
    ExtCtrls, AdvObj;

type
    TfrmRQBillItemEdit = class(TDialogForm)

    lblCode : TLabel;
	  edtCode : TEdit;
  

  HTTPRIORQBillItem: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    pcBillItem: TPageControl;
    tsBillItems: TTabSheet;
    tsOrder: TTabSheet;
    lblMaterialNameTxt: TLabel;
    lblMeasurementNameTxt: TLabel;
    lblCountFact: TLabel;
    lblSumWithoutNds: TLabel;
    lblCommentGen: TLabel;
    lblTKMaterialsMaterialName: TLabel;
    lblSumNds: TLabel;
    lblContractNumber: TLabel;
    spbTKMaterialsMaterial: TSpeedButton;
    spbContractNumberSelect: TSpeedButton;
    edtMaterialNameTxt: TEdit;
    edtMeasurementNameTxt: TEdit;
    edtCountFact: TEdit;
    edtSumWithOutNds: TEdit;
    edtCommentGen: TEdit;
    edtTKMaterialsMaterialName: TEdit;
    edtPriceWithOutNds: TEdit;
    edtContractNumber: TEdit;
    grpRQOrder: TGroupBox;
    sgRQOrder: TAdvStringGrid;
    spl1: TSplitter;
    grpRQOrderItem: TGroupBox;
    sgRQOrderItem: TAdvStringGrid;
    HTTPRIORQOrder: THTTPRIO;
    HTTPRIORQOrderItem: THTTPRIO;
    lblSumWithNds: TLabel;
    edtSumWithNds: TEdit;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbTKMaterialsMaterialClick(Sender : TObject);
  procedure edtPriceWithOutNdsChange(Sender: TObject);
  procedure spbContractNumberSelectClick(Sender: TObject);
  procedure pcBillItemChange(Sender: TObject);
  procedure actRQOrderViewExecute(Sender: TObject);
  procedure actRQOrderItemViewExecute(Sender: TObject);
    procedure edtSumWithOutNdsChange(Sender: TObject);
  
  private
    { Private declarations }
  public
    billItemCode : Integer;
    RQBillObj: RQBill;
    { Public declarations }

end;

var
  frmRQBillItemEdit: TfrmRQBillItemEdit;
  RQBillItemObj: RQBillItem;

  RQOrderHeaders: array [1..13] of String =
        ( 'Код'
          ,'№ заявки'
          ,'№ проекта'
          ,'Період'//'Період (місяць)'
          ,'Дата складання'
          ,'Підрозділ'
          ,'Вид заявки'
          ,'Тип заявки'
          ,'Вид ресурса'
          ,'Бюджетотримач'
          ,'Сума (з ПДВ)'
          ,'Статус'
          ,'користувач'
        );

  RQOrderItemHeaders: array [1..15] of String =
        ( 'Код'
          ,'№'
          ,'Код ДДС'
          ,'Матеріал(Довідник)'
          ,'Од. виміру(Довідник)'
          ,'Кількість'
          ,'Ціна (з ПДВ)'
          ,'Сума (з ПДВ)'
          ,'Строк поставки'
          ,'Запл.дата сплати'
          ,'Запл.дата постачання'
          ,'Кількість первинна'
          ,'Постачальник'
          ,'№ та дата договору'
          ,'Примітка'
        );


implementation

uses
  ShowTKMaterials
  , TKMaterialsController, ShowFINServicesObject, ENServicesObjectController
  , ENConsts, RQOrderController, RQOrderItemController
  , EditRQOrder, EditRQOrderItem
;

{uses  
    EnergyproController, EnergyproController2, RQBillItemController  ;
}
{$R *.dfm}



procedure TfrmRQBillItemEdit.FormShow(Sender: TObject);

begin

  pcBillItem.ActivePage := tsBillItems;
  if not (DialogState = dsView) then tsOrder.TabVisible := false;

  SetFloatStyle([edtPriceWithOutNds, edtSumWithOutNds ,  edtSumWithNds ]);

  if DialogState = dsView then
  begin
//     DisableControls([
    DisableControls([
      edtTKMaterialsMaterialName
      ,spbTKMaterialsMaterial
      , spbContractNumberSelect
      , edtContractNumber
      , spbContractNumberSelect
       ]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
      DisableControls([
      edtCode
      //,edtSumWithOutNds
      ,edtCountFact
      ,edtTKMaterialsMaterialName
      ,spbTKMaterialsMaterial
      , edtContractNumber
      , spbContractNumberSelect
       ]);
    DenyBlankValues([
       edtPriceWithOutNds
      ,edtSumWithOutNds
      ,edtSumWithNds
      //,edtSumGen
      //,edtCountFact
      //, edtContractNumber
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(RQBillItemObj.code);

    edtMaterialNameTxt.Text := RQBillItemObj.materialNameTxt;
    edtMeasurementNameTxt.Text := RQBillItemObj.measurementNameTxt; 
    if ( RQBillItemObj.countFact <> nil ) then
       edtCountFact.Text := RQBillItemObj.countFact.decimalString
    else
       edtCountFact.Text := '';

       edtSumWithOutNds.OnChange := nil;
    try
    if ( RQBillItemObj.sumWithoutNds <> nil ) then
       edtSumWithOutNds.Text := RQBillItemObj.sumWithoutNds.decimalString
    else
       edtSumWithOutNds.Text := '';
    finally
       edtSumWithOutNds.OnChange :=  edtSumWithOutNdsChange;
    end;

     if ( RQBillItemObj.sumGen <> nil ) then
       edtSumWithNds.Text := RQBillItemObj.sumGen.decimalString
    else
       edtSumWithNds.Text := '0';

    edtPriceWithOutNds.OnChange := nil;
    try
      if ( RQBillItemObj.priceWithNds <> nil ) then
         edtPriceWithOutNds.Text := RQBillItemObj.priceWithoutNds.decimalString
      else
         edtPriceWithOutNds.Text := '';
    finally
      edtPriceWithOutNds.OnChange := edtPriceWithOutNdsChange;
    end;

    edtCommentGen.Text := RQBillItemObj.commentGen;

    edtTKMaterialsMaterialName.Text := RQBillItemObj.material.name;

    if length(RQBillItemObj.contractNumber) > 0 then
      begin
        edtContractNumber.Text := '№ ' + RQBillItemObj.contractNumber + ' від ' + DateToStr(EncodeDate(RQBillItemObj.contractDate.Year,RQBillItemObj.contractDate.Month,RQBillItemObj.contractDate.Day));
      end;
    

  end;
end;



procedure TfrmRQBillItemEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQBillItem: RQBillItemControllerSoapPort;
begin
	if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
	begin
		if not NoBlankValues([
				edtCountFact
				,edtPriceWithOutNds
				,edtSumWithOutNds
        ,edtSumWithNds
			 ])  then
		begin
				Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
				Action:=caNone;
		end
		else

		if (RQBillObj.contractNumber <> RQBillItemObj.contractNumber) and (RQBillItemObj.contractNumber<>'') then
		begin
		 if Application.MessageBox(PChar('№ договору відрізняється!!!! Ви дійсно бажаєте змінити № договору?'),
											 PChar('Увага!'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) <> IDOK then
			 Exit;
		end;

		begin
			TempRQBillItem := HTTPRIORQBillItem as RQBillItemControllerSoapPort;


			 if (RQBillItemObj.countGen = nil ) then
				 RQBillItemObj.countGen := TXSDecimal.Create;

			 RQBillItemObj.materialNameTxt := edtMaterialNameTxt.Text; 

			 RQBillItemObj.measurementNameTxt := edtMeasurementNameTxt.Text;

			 if (RQBillItemObj.countFact = nil ) then
				 RQBillItemObj.countFact := TXSDecimal.Create;
			 if edtCountFact.Text <> '' then
				 RQBillItemObj.countFact.decimalString := edtCountFact.Text 
			 else
				 RQBillItemObj.countFact := nil;

			 if (RQBillItemObj.priceWithoutNds = nil ) then
				 RQBillItemObj.priceWithoutNds := TXSDecimal.Create;
			 if edtPriceWithOutNds.Text <> '' then
				 RQBillItemObj.priceWithoutNds.decimalString := edtPriceWithOutNds.Text
			 else
				 RQBillItemObj.priceWithoutNds := nil;

			 if (RQBillItemObj.sumWithoutNds = nil ) then
				 RQBillItemObj.sumWithoutNds := TXSDecimal.Create;
			 if edtSumWithOutNds.Text <> '' then
				 RQBillItemObj.sumWithoutNds.decimalString := edtSumWithOutNds.Text
			 else
				 RQBillItemObj.sumWithoutNds := nil;

       if edtSumWithNds.Text <> '' then
				 RQBillItemObj.sumGen.decimalString := edtSumWithNds.Text
			 else
				 RQBillItemObj.sumGen.DecimalString := '0';

			 RQBillItemObj.commentGen := edtCommentGen.Text;

			if DialogState = dsInsert then
			begin
				RQBillItemObj.code:=low(Integer);

				/////////////
				TempRQBillItem.add(RQBillItemObj);

			end
			else
			if DialogState = dsEdit then
			begin
				TempRQBillItem.save(RQBillItemObj);
			end;
		end;
	end;
end;


procedure TfrmRQBillItemEdit.spbTKMaterialsMaterialClick(Sender : TObject);
var 
   frmTKMaterialsShow: TfrmTKMaterialsShow;
begin
   frmTKMaterialsShow:=TfrmTKMaterialsShow.Create(Application,fmNormal);
   try
      with frmTKMaterialsShow do
        if ShowModal = mrOk then
        begin
            try
               if RQBillItemObj.material = nil then RQBillItemObj.material := TKMaterials.Create();
                //RQBillItemObj.material.code := StrToInt(GetReturnValue(sgTKMaterials,0));
                //edtTKMaterialsMaterialName.Text:=GetReturnValue(sgTKMaterials,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmTKMaterialsShow.Free;
   end;
end;



procedure TfrmRQBillItemEdit.edtPriceWithOutNdsChange(Sender: TObject);
var price, count ,sumWithOutNds ,curr_nds, curr_nds_coeff : Double;
begin
  try
    price := StrToFloat(edtPriceWithOutNds.Text);
  except
    on EConvertError do
      price := 0;
  end;

  try
    count := StrToFloat(edtCountFact.Text);
  except
    on EConvertError do
      count := 0;
  end;
  edtSumWithOutNds.Text := FloatToStr(Conv(price * count, 2));


  //NET-4274 пересчет суммы с ндс
   try
    sumWithOutNds := StrToFloat(edtSumWithOutNds.Text);
  except
    on EConvertError do
      sumWithOutNds := 0;
  end;

   try
  curr_nds:=  StrToFloat(RQBillObj.vat.DecimalString);
    except
    on EConvertError do
      curr_nds := 0;
  end;


  if RQBillObj.vat <> nil then
  begin
   if RQBillObj.vat.DecimalString = '0'  then
    edtSumWithNds.Text := FloatToStr(Conv(sumWithOutNds , 2))
   else
    begin
    curr_nds_coeff := curr_nds / 100 + 1;
    edtSumWithNds.Text := FloatToStr(Conv(sumWithOutNds * curr_nds_coeff , 2));
    end;


  end;

end;


procedure TfrmRQBillItemEdit.edtSumWithOutNdsChange(Sender: TObject);
var sumWithOutNds , curr_nds_coeff  , curr_nds : Double;
begin

  //NET-4274 пересчет суммы с ндс
   try
    sumWithOutNds := StrToFloat(edtSumWithOutNds.Text);
  except
    on EConvertError do
      sumWithOutNds := 0;
  end;

  try
  curr_nds:=  StrToFloat(RQBillObj.vat.DecimalString);
    except
    on EConvertError do
      curr_nds := 0;
  end;

  if RQBillObj.vat <> nil then
  begin
   if RQBillObj.vat.DecimalString = '0'  then
    edtSumWithNds.Text := FloatToStr(Conv(sumWithOutNds , 2))
   else
    begin
    curr_nds_coeff := curr_nds / 100 + 1;
    edtSumWithNds.Text := FloatToStr(Conv(sumWithOutNds * curr_nds_coeff , 2));
    end;


  end;

end;

procedure TfrmRQBillItemEdit.spbContractNumberSelectClick(Sender: TObject);
var
   frmFINServicesObjectShow: TfrmFINServicesObjectShow;
   f : ENServicesObjectFilter;
begin     
   f := ENServicesObjectFilter.Create();
   SetNullXSProps(f);
   SetNullIntProps(f);


   if (RQBillObj.org.id > LOW_INT) then
     f.conditionSQL := ' a.io_flag = ''B'' and p.id = ' + IntToStr(RQBillObj.org.id)
   else
     f.conditionSQL := ' a.io_flag = ''B''';


   frmFINServicesObjectShow:=TfrmFINServicesObjectShow.Create(Application,fmNormal, f);
   frmFINServicesObjectShow.contrAgentType := AX_CONTRAGENT_TYPE_VENDOR;
   try
      with frmFINServicesObjectShow do
        if ShowModal = mrOk then
        begin
            try

                edtContractNumber.Text := '№ ' + GetReturnValue(sgFINServicesObject, 1) + ' від ' + GetReturnValue(sgFINServicesObject, 2);
                RQBillItemObj.contractNumber := GetReturnValue(sgFINServicesObject, 1);
                RQBillItemObj.contractDate := TXSDate.Create;
                RQBillItemObj.contractDate.XSToNative(GetXSDate( StrToDate(GetReturnValue(sgFINServicesObject, 2)) ));
                RQBillItemObj.finDocCode  := GetReturnValue(sgFINServicesObject, 5);
                RQBillItemObj.finDocId := StrToInt(GetReturnValue(sgFINServicesObject, 6));

             except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmFINServicesObjectShow.Free;
   end;
end;



procedure TfrmRQBillItemEdit.pcBillItemChange(Sender: TObject);
var
  i, LastCount : Integer;
  RQOrderFilterObj : RQOrderFilter;
  RQOrderItemFilterObj : RQOrderItemFilter;

  TempRQOrder : RQOrderControllerSoapPort;
  RQOrderList : RQOrderShortList;

  TempRQOrderItem : RQOrderItemControllerSoapPort;
  RQOrderItemList : RQOrderItemShortList;

  objCodeCondition : String;

begin
  inherited;

      if pcBillItem.ActivePage = tsOrder then
      begin
        ClearGrids([sgRQOrder, sgRQOrderItem]);
        SetGridHeaders(RQOrderHeaders, sgRQOrder.ColumnHeaders);
        SetGridHeaders(RQOrderItemHeaders, sgRQOrderItem.ColumnHeaders);

        TempRQOrder := HTTPRIORQOrder as RQOrderControllerSoapPort;
        TempRQOrderItem := HTTPRIORQOrderItem as RQOrderItemControllerSoapPort;

        RQOrderItemFilterObj := RQOrderItemFilter.Create;
        SetNullIntProps(RQOrderItemFilterObj);
        SetNullXSProps(RQOrderItemFilterObj);
        RQOrderItemFilterObj.material := TKMaterials.Create;
        RQOrderItemFilterObj.material.code := RQBillItemObj.material.code;
        RQOrderItemFilterObj.conditionSQL := 'rqorderitem.code in '
                    +'(select b2o.orderitemrefcode from rqbillitem2orderitem b2o where b2o.billitemrefcode = '
                    + IntToStr(RQBillItemObj.code) +')';
        RQOrderItemList := TempRQOrderItem.getScrollableFilteredList(RQOrderItemFilterObj, 0, -1);

        RQOrderFilterObj := RQOrderFilter.Create;
        SetNullXSProps(RQOrderFilterObj);
        SetNullIntProps(RQOrderFilterObj);
        RQOrderFilterObj.conditionSQL := 'rqorder.code in (select rqorderitem.orderrefcode from rqorderitem where rqorderitem.code in '
                    +'(select b2o.orderitemrefcode from rqbillitem2orderitem b2o where b2o.billitemrefcode = '
                    + IntToStr(RQBillItemObj.code) +'))';
        RQOrderList := TempRQOrder.getScrollableFilteredList(RQOrderFilterObj, 0, -1);

        LastCount:=High(RQOrderList.list);

        if LastCount > -1 then
           sgRQOrder.RowCount:=LastCount+2
        else
           sgRQOrder.RowCount:=2;

         with sgRQOrder do
          for i:=0 to LastCount do
            begin

              if RQOrderList.list[i].code <> Low(Integer) then
              Cells[0,i+1] := IntToStr(RQOrderList.list[i].code)
              else
              Cells[0,i+1] := '';
              Cells[1,i+1] := RQOrderList.list[i].numberDoc;
              Cells[2,i+1] := RQOrderList.list[i].numberProject;
              if RQOrderList.list[i].orderPeriod = nil then
                Cells[3,i+1] := ''
              else
                Cells[3,i+1] := MonthesNames[RQOrderList.list[i].orderPeriod.Month] + ' ' +
                                IntToStr(RQOrderList.list[i].orderPeriod.Year) + ' р.';

              if RQOrderList.list[i].dateGen = nil then
                Cells[4,i+1] := ''
              else
                Cells[4,i+1] := XSDate2String(RQOrderList.list[i].dateGen);

              Cells[5, i + 1] := RQOrderList.list[i].departmentRefShortName;
              Cells[6, i + 1] := RQOrderList.list[i].rqOrderFormName;
              Cells[7, i + 1] := RQOrderList.list[i].rqOrderTypeName;
              Cells[8, i + 1] := RQOrderList.list[i].rqOrderResourceName;
              Cells[9, i + 1] := RQOrderList.list[i].budgetRefShortName;

              Colors[9, i + 1] := clYellow;

              if RQOrderList.list[i].sumGen <> nil then
                Cells[10, i + 1] := SeparateThousands(RQOrderList.list[i].sumGen.DecimalString)
              else
                Cells[10, i + 1] := '0.00';

              Alignments[10, i + 1] := taRightJustify;
              Colors[10, i + 1] := $0080FF80;

              Cells[11, i + 1] := RQOrderList.list[i].statusRefName;

              Cells[12, i + 1] := RQOrderList.list[i].userGen;

              sgRQOrder.RowCount:=i+2;
            end;
         sgRQOrder.Row:=1;

        ////// СТРОКА ЗАЯВКИ
        if High(RQOrderItemList.list) > -1 then
           sgRQOrderItem.RowCount:=High(RQOrderItemList.list)+2
        else
           sgRQOrderItem.RowCount:=2;

         with sgRQOrderItem do
          for i:=0 to High(RQOrderItemList.list) do
            begin
              Application.ProcessMessages;
              if RQOrderItemList.list[i].code <> Low(Integer) then
              Cells[0,i+1] := IntToStr(RQOrderItemList.list[i].code)
              else
              Cells[0,i+1] := '';

              Cells[1,i+1] := IntToStr(i + 1);
              Cells[2,i+1] := RQOrderItemList.list[i].ddsCodesTxtCode;

              Cells[3,i+1] :=  RQOrderItemList.list[i].materialName + ' (код ДК: ' + RQOrderItemList.list[i].materialIdentId + ')';
              Cells[4,i+1] :=  RQOrderItemList.list[i].measurementName;

              if RQOrderItemList.list[i].countFact = nil then
                Cells[5,i+1] := ''
              else
                Cells[5,i+1] := SeparateThousands(RQOrderItemList.list[i].countFact.DecimalString);

              Alignments[5, i + 1] := taRightJustify;

              if RQOrderItemList.list[i].priceWithNds = nil then
                Cells[6,i+1] := ''
              else
                Cells[6,i+1] := SeparateThousands(RQOrderItemList.list[i].priceWithNds.DecimalString);

              Alignments[6, i + 1] := taRightJustify;
              Colors[6, i + 1] := $0080FF80;

              /////
              //itemSum := 0;

              if RQOrderItemList.list[i].sumGen = nil then
                Cells[7,i+1] := ''
              else begin
                Cells[7,i+1] := SeparateThousands(RQOrderItemList.list[i].sumGen.DecimalString);
              end;

              Alignments[7, i + 1] := taRightJustify;

              //totalSum := totalSum + itemSum;
              /////

              if RQOrderItemList.list[i].deliveryTime = LOW_INT then
                 Cells[8, i+1] := ''
              else
                Cells[8, i+1] := IntToStr(RQOrderItemList.list[i].deliveryTime);


              if RQOrderItemList.list[i].plannedDatePays = nil then
                  Cells[9, i+1] := ''
              else
                  Cells[9, i+1] := DateToStr ( EncodeDate(RQOrderItemList.list[i].plannedDatePays.Year,RQOrderItemList.list[i].plannedDatePays.Month,RQOrderItemList.list[i].plannedDatePays.Day) );

              if RQOrderItemList.list[i].plannedDateDelivery = nil then
                  Cells[10, i+1] := ''
              else
                  Cells[10, i+1] := DateToStr ( EncodeDate(RQOrderItemList.list[i].plannedDateDelivery.Year,RQOrderItemList.list[i].plannedDateDelivery.Month,RQOrderItemList.list[i].plannedDateDelivery.Day) );

              if RQOrderItemList.list[i].countGen = nil then
                Cells[11,i+1] := ''
              else
                Cells[11,i+1] := RQOrderItemList.list[i].countGen.DecimalString;

              Cells[12,i+1] := RQOrderItemList.list[i].orgName;

              if RQOrderItemList.list[i].contractDate <> nil then
                Cells[13, i+1] := RQOrderItemList.list[i].contractNumber + ' від ' + DateToStr ( EncodeDate(RQOrderItemList.list[i].contractDate.Year,RQOrderItemList.list[i].contractDate.Month,RQOrderItemList.list[i].contractDate.Day) )
              else begin
                ///// 23.12.10
                // Разрешаем вводить руками (не выбирая из ФК)!
                //Cells[13, i+1] := '';
                Cells[13, i+1] := RQOrderItemList.list[i].contractNumber;
              end;

              Cells[14,i+1] := RQOrderItemList.list[i].commentGen;
              //Cells[8,i+1] := RQOrderItemList.list[i].userGen;

              //LastRow:=i+1;
              sgRQOrderItem.RowCount:=High(RQOrderItemList.list)+2;

          end;
       //ColCount:=ColCount+1;
       sgRQOrderItem.Row:=1;
      end;

end;

procedure TfrmRQBillItemEdit.actRQOrderViewExecute(Sender: TObject);
var
 TempRQOrder : RQOrderControllerSoapPort;
 ObjCode : Integer;
begin
 TempRQOrder := HTTPRIORQOrder as RQOrderControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQOrder.Cells[0,sgRQOrder.Row]);
   except
   on EConvertError do Exit;
  end;

  frmRQOrderEdit := TfrmRQOrderEdit.Create(Application, dsView);

  try
    frmRQOrderEdit.RQOrderObj := TempRQOrder.getObject(ObjCode);
    frmRQOrderEdit.ShowModal;
  finally
    frmRQOrderEdit.Free;
    frmRQOrderEdit := nil;
  end;
end;

procedure TfrmRQBillItemEdit.actRQOrderItemViewExecute(Sender: TObject);
var
 TempRQOrderItem : RQOrderItemControllerSoapPort;
 ObjCode : Integer;
begin
   TempRQOrderItem := HTTPRIORQOrderItem as RQOrderItemControllerSoapPort;
   try
     RQOrderItemObj := TempRQOrderItem.getObject(StrToInt(sgRQOrderItem.Cells[0,sgRQOrderItem.Row]));
   except
     on EConvertError do Exit;
   end;

   frmRQOrderItemEdit := TfrmRQOrderItemEdit.Create(Application, dsView);

   try
     frmRQOrderItemEdit.orderKindCode := LOW_INT;
     frmRQOrderItemEdit.ShowModal;
   finally
     frmRQOrderItemEdit.Free;
     frmRQOrderItemEdit := nil;
   end;
end;


end.
