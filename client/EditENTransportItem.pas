
unit EditENTransportItem;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENTransportItemController,
  TB2Item, TB2Dock, TB2Toolbar, AdvObj
  //, ENPlanWorkController
   ;

type
  TfrmENTransportItemEdit = class(TDialogForm)
    lblUserGen : TLabel;
    edtUserGen: TEdit;
    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;

  btnOk: TButton;
  btnCancel: TButton;
    pcTransport: TPageControl;
    tsTransport: TTabSheet;
    tsDistances: TTabSheet;
    lblCountGen: TLabel;
    lblCountFact: TLabel;
    lblPrice: TLabel;
    lblCost: TLabel;
    lblCommentGen: TLabel;
    spbTKTransportRealTransportReal: TSpeedButton;
    lblTKTransportRealTransportRealName: TLabel;
    spbENManningTableManningTable: TSpeedButton;
    lblENManningTableManningTableName: TLabel;
    spbENWorkerWorkerFact: TSpeedButton;
    lblENWorkerWorkerFactName: TLabel;
    lblTKTransport: TLabel;
    spbTKTransportTransport: TSpeedButton;
    lblEnPlan: TLabel;
    lblPlanItem: TLabel;
    spbPlan: TSpeedButton;
    spbPlanItem: TSpeedButton;
    lblDistanceTo: TLabel;
    lblDistanceAlong: TLabel;
    lblDistanceFrom: TLabel;
    Label1: TLabel;
    edtCountGen: TEdit;
    edtCountFact: TEdit;
    edtPrice: TEdit;
    edtCost: TEdit;
    edtCommentGen: TEdit;
    edtTKTransportRealTransportRealName: TEdit;
    edtENManningTableManningTableName: TEdit;
    edtENWorkerWorkerFactName: TEdit;
    edtTKTransport: TEdit;
    edtPlan: TEdit;
    edtPlanItem: TEdit;
    edtDistanceFrom: TEdit;
    edtDistanceAlong: TEdit;
    edtDistanceTo: TEdit;
    cbTransportType: TComboBox;
    HTTPRIOENTransportItem: THTTPRIO;
    HTTPRIOTKTransportReal: THTTPRIO;
    HTTPRIOENPlanWorkItem: THTTPRIO;
    HTTPRIOENPlanWork: THTTPRIO;
    HTTPRIOENWorker: THTTPRIO;
    sgENDistance: TAdvStringGrid;
    HTTPRIOENDistance: THTTPRIO;
    ActionList1: TActionList;
    actView: TAction;
    actInsert: TAction;
    actEdit: TAction;
    actDelete: TAction;
    actUpdate: TAction;
    ImageList1: TImageList;
    tbActions: TTBToolbar;
    btnView: TTBItem;
    btnAdd: TTBItem;
    TBItem47: TTBItem;
    TBItem7: TTBItem;
    TBItem46: TTBItem;
    HTTPRIOFINWorker: THTTPRIO;
    spbTransportRealClear: TSpeedButton;
    spbFINWorkerClear: TSpeedButton;
    lblPK: TLabel;
    edtCode: TEdit;
    tsDelivery: TTabSheet;
    sgENDeliveryOrder: TAdvStringGrid;
    HTTPRIOENDeliveryOrder: THTTPRIO;
    TBToolbar1: TTBToolbar;
    TBItem1: TTBItem;
    TBItem2: TTBItem;
    TBItem3: TTBItem;
    TBItem4: TTBItem;
    TBItem5: TTBItem;
    lblisSentAssignment: TLabel;
    isSentAssignment: TCheckBox;
    lblNumberList: TLabel;
    edtNumberList: TMemo;
    lblIsUseTrailer: TLabel;
    IsUseTrailer: TCheckBox;
    lblTrailer: TLabel;
    edtTrailerRealName: TEdit;
    spbTrailerReal: TSpeedButton;
    spbTrailerRealClear: TSpeedButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);

  procedure spbENManningTableManningTableClick(Sender : TObject);
  procedure spbENWorkerWorkerFactClick(Sender : TObject);
    procedure spbTKTransportTransportClick(Sender: TObject);
    procedure pcTransportChange(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actViewExecute(Sender: TObject);

procedure spbTKTransportRealTransportRealClick(Sender : TObject);
procedure actEditExecute(Sender: TObject);
procedure actDeleteExecute(Sender: TObject);
procedure actUpdateExecute(Sender: TObject);
    procedure spbTransportRealClearClick(Sender: TObject);
    procedure spbFINWorkerClearClick(Sender: TObject);
    procedure spbTrailerRealClick(Sender: TObject);
    procedure spbTrailerRealClearClick(Sender: TObject);




  private
    { Private declarations }
  public
    isTransport : Boolean;
    planKindCode : Integer;
    { Public declarations }
    procedure UpdateGrid(Sender: TObject);
    procedure recalcDistances();
end;

var
  frmENTransportItemEdit: TfrmENTransportItemEdit;
  ENTransportItemObj: ENTransportItem;
  //departmentCode : Integer = -1;

  ENDistanceHeaders: array [1..4] of String =
        ( 'Код'
          ,'Тип відстані'
          ,'Тип дороги'
          ,'відстань (км)'
        );


  ENDeliveryOrderHeaders: array [1..7] of String =
        ( 'Код'
        , 'гос.№'
        ,'Назва'
        ,'Водій'
        ,'Об"єкт'
        ,'Інв.№ об"єкту'
        ,'Загальна відстань, км'
        );
                
implementation

uses
  ShowTKTransportReal
  ,TKTransportRealController
  ,ShowENManningTable
  ,ENManningTableController
  ,ShowENWorker
  ,ENWorkerController
, DMReportsUnit, ENPlanWorkController, ENDepartmentController,
  TKTransportController, ShowTKTransport, ENPlanWorkItemController,
  TKTransportTypeController, ENDistanceController, EditENDistance,
  ENConsts, ShowFINWorker, FINWorkerController, ENDeliveryOrderController,
  EditENDeliveryOrder;

{uses  
    EnergyproController, EnergyproController2, ENTransportItemController  ;
}
{$R *.dfm}


procedure TfrmENTransportItemEdit.recalcDistances();
var
  TempENDistance: ENDistanceControllerSoapPort;
  i,j: Integer;
  ENDistanceList: ENDistanceShortList;
  f : ENDistanceFilter;
  to_, from_, along_ : double;
begin

  TempENDistance :=  HTTPRIOENDistance as ENDistanceControllerSoapPort;

  F := ENDistanceFilter.Create;
  SetNullIntProps(F);
  SetNullXSProps(F);


  f.transportItemRef := ENTransportItemRef.Create;
  f.transportItemRef.code := ENTransportItemObj.code;

  ENDistanceList := TempENDistance.getScrollableFilteredList(f,0,-1);

  to_ := 0;
  from_:=0;
  along_:=0;


    for i:=0 to High(ENDistanceList.list) do
      begin
        if  ENDistanceList.list[i].typeRefCode =  ENDISTANCETYPE_TO then
           to_ := to_ + StrToFloat(ENDistanceList.list[i].distance.DecimalString);
        if  ENDistanceList.list[i].typeRefCode =  ENDISTANCETYPE_ALONG then
           along_ := along_ + StrToFloat(ENDistanceList.list[i].distance.DecimalString);
        if  ENDistanceList.list[i].typeRefCode =  ENDISTANCETYPE_FROM then
           from_ := from_ + StrToFloat(ENDistanceList.list[i].distance.DecimalString);

      end;

      edtDistanceFrom.Text := FloatToStr(from_);
      edtDistanceAlong.Text := FloatToStr(along_);
      edtDistanceTo.Text := FloatToStr(to_);


end;


procedure TfrmENTransportItemEdit.FormShow(Sender: TObject);
var
    TempENPlanWorkItem: ENPlanWorkItemControllerSoapPort;
    //ENPlanWorkItemObj: ENPlanWorkItem;
    ENPlanWorkItemFilterObj: ENPlanWorkItemFilter;
    ENPlanWorkItemList: ENPlanWorkItemShortList;

    TempENPlanWork: ENPlanWorkControllerSoapPort;
    //ENPlanWorkObj: ENPlanWork;
    ENPlanWorkFilterObj: ENPlanWorkFilter;
    ENPlanWorkList: ENPlanWorkShortList;

    TempTKTransportReal : TKTransportRealControllerSoapPort;
    TKTransportRealFilterObj :TKTransportRealFilter;
    TKTransportRealList : TKTransportRealShortList;
    invNumber : String;
    
begin
//  DisableControls();

  planKindCode := LOW_INT;
  
  pcTransport.ActivePage := tsTransport;

  //tsDelivery.TabVisible := false;

  DisableControls([edtDistanceFrom, edtDistanceAlong, edtDistanceTo]);


  DisableControls([edtCountGen, edtTKTransport, edtTKTransportRealTransportRealName, edtENManningTableManningTableName,
                   edtENWorkerWorkerFactName, spbPlan, spbPlanItem, edtTrailerRealName
                   , edtPlan
                   , edtPlanItem
                   ]);
                   
  SetFloatStyle([edtCountFact, edtPrice, edtCost, edtDistanceFrom, edtDistanceAlong, edtDistanceTo]);


  if (DialogState = dsEdit) then
  begin
      DisableControls([edtTKTransport, spbTKTransportTransport, edtCountGen]);
      edtCode.Text := IntToStr(ENTransportItemObj.code);
  end;

  if (DialogState = dsView) then
  begin
    DisableControls([spbTKTransportTransport, spbENManningTableManningTable, spbTKTransportRealTransportReal, spbENWorkerWorkerFact, spbTrailerReal ]);
    DisableActions([actInsert, actEdit, actDelete]);
    edtCode.Text := IntToStr(ENTransportItemObj.code);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      //edtCountGen
      //,
      edtCountFact
      ,edtTKTransport
      ,edtENWorkerWorkerFactName
      ,edtTKTransportRealTransportRealName      
     ]);
   end;

   if DialogState = dsInsert then
   begin
     tsDistances.TabVisible := false;
     tsDelivery.TabVisible := false;
   end;

   if isTransport then
   begin
     DisableControls([edtTKTransportRealTransportRealName, spbTKTransportRealTransportReal,
        spbTransportRealClear, cbTransportType]);
   end;

    if ENTransportItemObj.planRef <> nil then
      if ENTransportItemObj.planRef.code <> Low(Integer) then
      begin

        //HideControls([  lblEnPlan, edtPlan, spbPlan ], false);

        TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
        //ENPlanWorkObj := TempENPlanWork.getObject(ENEstimateItemObj.planRef.code);

        ENPlanWorkFilterObj := ENPlanWorkFilter.Create;
        try
          SetNullIntProps(ENPlanWorkFilterObj);
          SetNullXSProps(ENPlanWorkFilterObj);

          ENPlanWorkFilterObj.code := ENTransportItemObj.planRef.code;

          //ENPlanWorkList := TempENPlanWork.getFilteredList(ENPlanWorkFilterObj);
          ENPlanWorkList := TempENPlanWork.getScrollableFilteredList(ENPlanWorkFilterObj, 0, -1);

          if ENPlanWorkList <> nil then
            if ENPlanWorkList.list <> nil then
              if High(ENPlanWorkList.list) >= 0 then
               begin
                 edtPlan.Text := ENPlanWorkList.list[0].objectName;
                 invNumber := ENPlanWorkList.list[0].invNumber;
                 planKindCode :=  ENPlanWorkList.list[0].kindCode;
               end;
        finally
          ENPlanWorkFilterObj.Free;
        end;
      end;

    if ENTransportItemObj.planItemRef <> nil then
      if ENTransportItemObj.planItemRef.code <> Low(Integer) then
      begin

       HideControls([  lblPlanItem , edtPlanItem, spbPlanItem ], false );
       //edtPlanItem.Text := ENPlanWorkItemName;

        TempENPlanWorkItem := HTTPRIOENPlanWorkItem as ENPlanWorkItemControllerSoapPort;
        //ENPlanWorkItemObj := TempENPlanWorkItem.getObject(ENEstimateItemObj.planItemRef.code);

        ENPlanWorkItemFilterObj := ENPlanWorkItemFilter.Create;
        try
          SetNullIntProps(ENPlanWorkItemFilterObj);
          SetNullXSProps(ENPlanWorkItemFilterObj);

          ENPlanWorkItemFilterObj.code := ENTransportItemObj.planItemRef.code;

          //ENPlanWorkItemList := TempENPlanWorkItem.getFilteredList(ENPlanWorkItemFilterObj);
          ENPlanWorkItemList := TempENPlanWorkItem.getScrollableFilteredList(ENPlanWorkItemFilterObj, 0, -1);

          if ENPlanWorkItemList <> nil then
            if ENPlanWorkItemList.list <> nil then
              if High(ENPlanWorkItemList.list) >= 0 then
                edtPlanItem.Text := ENPlanWorkItemList.list[0].kartaRefName;
        finally
          ENPlanWorkItemFilterObj.Free;
        end;
      end;
    //end;


    ////////////////

      if (DialogState = dsEdit) and (invNumber <> '') and (isTransport) then
      begin
        TempTKTransportReal := HTTPRIOTKTransportReal as TKTransportRealControllerSoapPort;
        TKTransportRealFilterObj := TKTransportRealFilter.Create;
        try
          SetNullIntProps(TKTransportRealFilterObj);
          SetNullXSProps(TKTransportRealFilterObj);

          TKTransportRealFilterObj.invNumber := invNumber;

          TKTransportRealList := TempTKTransportReal.getScrollableFilteredList(TKTransportRealFilterObj, 0, -1);

          if TKTransportRealList <> nil then
            if TKTransportRealList.list <> nil then
              if High(TKTransportRealList.list) >= 0 then
              begin
               if ENTransportItemObj.transportReal = nil then ENTransportItemObj.transportReal := TKTransportReal.Create();
                  ENTransportItemObj.transportReal.code := TKTransportRealList.list[0].code;
                  edtTKTransportRealTransportRealName.Text := TKTransportRealList.list[0].name;
              end;
        finally
          TKTransportRealFilterObj.Free;
        end;
      end;

    ////////////////





{
    // приходит из плана ...
    if ( ENTransportItemObj.distanceTo <> nil ) then
       edtDistanceTo.Text := ENTransportItemObj.distanceTo.decimalString
    else
       edtDistanceTo.Text := '';

    if ( ENTransportItemObj.distanceAlong <> nil ) then
       edtDistanceAlong.Text := ENTransportItemObj.distanceAlong.decimalString
    else
       edtDistanceAlong.Text := '';


    if ( ENTransportItemObj.distanceTo <> nil ) and ( ENTransportItemObj.distanceAlong <> nil ) and ( ENTransportItemObj.distanceFrom = nil ) then
    begin
      //if ( ENTransportItemObj.distanceFrom <> nil ) then
         edtDistanceFrom.Text := FloatToStr(StrToFloat(ENTransportItemObj.distanceTo.DecimalString) + StrToFloat(ENTransportItemObj.distanceAlong.DecimalString)) ; //ENTransportItemObj.distanceFrom.decimalString
      //else
      //   edtDistanceFrom.Text := '';
    end
    else
      edtDistanceFrom.Text := '';
}

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin



    if ENTransportItemObj.tktransportType <> nil then
    begin
       cbTransportType.ItemIndex := ENTransportItemObj.tktransportType.code - 1;
       if  ENTransportItemObj.tktransportType.code = TKTRANSPORT_TYPE_MECHANIZM then
       begin
         tsDistances.TabVisible := false;
         tsDelivery.TabVisible := false;
       end
       else
          recalcDistances();
    end;

{
    if ( ENTransportItemObj.distanceFrom <> nil ) then
       edtDistanceFrom.Text := ENTransportItemObj.distanceFrom.decimalString
    else
       edtDistanceFrom.Text := '';
}

    if ENTransportItemObj.transport <> nil then
       edtTKTransport.Text := ENTransportItemObj.transport.name
    else
       edtTKTransport.Text := '';
       

    if ( ENTransportItemObj.countWorkGen <> nil ) then
       edtCountGen.Text := ENTransportItemObj.countWorkGen.decimalString
    else
       edtCountGen.Text := ''; 
    if ( ENTransportItemObj.countWorkFact <> nil ) then
       edtCountFact.Text := ENTransportItemObj.countWorkFact.decimalString
    else
       edtCountFact.Text := ''; 
    if ( ENTransportItemObj.price <> nil ) then
       edtPrice.Text := ENTransportItemObj.price.decimalString
    else
       edtPrice.Text := ''; 
    if ( ENTransportItemObj.cost <> nil ) then
       edtCost.Text := ENTransportItemObj.cost.decimalString
    else
       edtCost.Text := ''; 
    edtCommentGen.Text := ENTransportItemObj.commentGen; 
    edtUserGen.Text := ENTransportItemObj.userGen; 
      if ENTransportItemObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENTransportItemObj.dateEdit.Year,ENTransportItemObj.dateEdit.Month,ENTransportItemObj.dateEdit.Day);
        edtDateEdit.checked := true;
      end
      else
      begin
        edtDateEdit.DateTime:=SysUtils.Date;
        edtDateEdit.checked := false;
      end;

    if edtTKTransportRealTransportRealName.Text = '' then
     edtTKTransportRealTransportRealName.Text := ENTransportItemObj.transportReal.name;

      if ENTransportItemObj.trailerTransportReal <> nil then
     edtTrailerRealName.Text := ENTransportItemObj.trailerTransportReal.name;

    //edtNumberList.Text := ENTransportItemObj.numberList;
    MakeMultiline(edtNumberList.Lines, ENTransportItemObj.numberList);

    {
    if ENTransportItemObj.manningTable <> nil then
    if ENTransportItemObj.manningTable.position <> nil then
       edtENManningTableManningTableName.Text := ENTransportItemObj.manningTable.position.name;

    edtENWorkerWorkerFactName.Text := ENTransportItemObj.workerFact.name;
    }

    if ENTransportItemObj.finWorker <> nil then
    begin
       edtENManningTableManningTableName.Text := ENTransportItemObj.finWorker.positionName;
       edtENWorkerWorkerFactName.Text := ENTransportItemObj.finWorker.name;
       isSentAssignment.Checked := (ENTransportItemObj.finWorker.isSentAssignment = 1);
    end;

    if ENTransportItemObj.isUseTrailer <> 1 then
       IsUseTrailer.Checked := False
       else  IsUseTrailer.Checked := True;

  end;
end;



procedure TfrmENTransportItemEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENTransportItem: ENTransportItemControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtCountGen
      ,edtCountFact
      ,edtTKTransport
      //,edtENWorkerWorkerFactName
      //,edtTKTransportRealTransportRealName
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENTransportItem := HTTPRIOENTransportItem as ENTransportItemControllerSoapPort;

    if  cbTransportType.ItemIndex = -1 then
    begin
      Application.MessageBox(PChar('Оберіть Тип транспортного засобу !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
      exit;
    end;

    // предупреждать что нельзя будет выбрать в Путевой лист ...
    if isTransport then
    begin
      recalcDistances();
      if (StrToFloat(edtCountFact.Text) = 0) and
        (( StrToFloat(edtDistanceFrom.Text) = 0) and (StrToFloat(edtDistanceTo.Text) = 0) and (StrToFloat(edtDistanceAlong.Text) = 0)) then
         Application.MessageBox(PChar('Введіть машиногодини або відстані для включення цього транспорту у Подорожні Листи ...'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
    end;

{
     if (ENTransportItemObj.distanceTo = nil ) then
       ENTransportItemObj.distanceTo := TXSDecimal.Create;
     if edtDistanceTo.Text <> '' then
       ENTransportItemObj.distanceTo.decimalString := edtDistanceTo.Text
     else
       ENTransportItemObj.distanceTo := nil;

     if (ENTransportItemObj.distanceAlong = nil ) then
       ENTransportItemObj.distanceAlong := TXSDecimal.Create;
     if edtDistanceAlong.Text <> '' then
       ENTransportItemObj.distanceAlong.decimalString := edtDistanceAlong.Text
     else
       ENTransportItemObj.distanceAlong := nil;

     if (ENTransportItemObj.distanceFrom = nil ) then
       ENTransportItemObj.distanceFrom := TXSDecimal.Create;
     if edtDistanceFrom.Text <> '' then
       ENTransportItemObj.distanceFrom.decimalString := edtDistanceFrom.Text
     else
       ENTransportItemObj.distanceFrom := nil;
}

     if (ENTransportItemObj.countWorkGen = nil ) then
       ENTransportItemObj.countWorkGen := TXSDecimal.Create;
     if edtCountGen.Text <> '' then
       ENTransportItemObj.countWorkGen.decimalString := edtCountGen.Text
     else
       ENTransportItemObj.countWorkGen := nil;

     if (ENTransportItemObj.countWorkFact = nil ) then
       ENTransportItemObj.countWorkFact := TXSDecimal.Create;
     if edtCountFact.Text <> '' then
       ENTransportItemObj.countWorkFact.decimalString := edtCountFact.Text
     else
       ENTransportItemObj.countWorkFact := nil;

     if (ENTransportItemObj.price = nil ) then
       ENTransportItemObj.price := TXSDecimal.Create;
     if edtPrice.Text <> '' then
       ENTransportItemObj.price.decimalString := edtPrice.Text 
     else
       ENTransportItemObj.price := nil;

     if (ENTransportItemObj.cost = nil ) then
       ENTransportItemObj.cost := TXSDecimal.Create;
     if edtCost.Text <> '' then
       ENTransportItemObj.cost.decimalString := edtCost.Text 
     else
       ENTransportItemObj.cost := nil;

     ENTransportItemObj.numberList := edtNumberList.Text;

     ENTransportItemObj.commentGen := edtCommentGen.Text; 

     ENTransportItemObj.userGen := edtUserGen.Text; 

     if edtdateEdit.checked then
     begin 
       if ENTransportItemObj.dateEdit = nil then
          ENTransportItemObj.dateEdit := TXSDate.Create;
       ENTransportItemObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENTransportItemObj.dateEdit := nil;

    if ENTransportItemObj.tktransportType = nil then ENTransportItemObj.tktransportType := TKTransportType.Create;
    ENTransportItemObj.tktransportType.code := cbTransportType.ItemIndex + 1;


    // путевые листы ...
    if (planKindCode = ENPLANWORKKIND_FACT)
       and (ENTransportItemObj.tktransportType.code <> TKTRANSPORT_TYPE_MECHANIZM)
       and (edtNumberList.Text = '')
       and (edtTKTransportRealTransportRealName.Text <> '') then
    begin
      Application.MessageBox(PChar('Введіть номер подорожнього листа !!!'),PChar('Увага!'), MB_ICONWARNING+MB_OK);
      Action:=caNone;
      exit;
    end;



    if ENTransportItemObj.finWorker <> nil then
    begin
      if (isSentAssignment.Checked) then
        ENTransportItemObj.finWorker.isSentAssignment := 1
      else
        ENTransportItemObj.finWorker.isSentAssignment := 0;
    end;


      if (IsUseTrailer.Checked) then
        ENTransportItemObj.isUseTrailer := 1
      else
      ENTransportItemObj.isUseTrailer := 0;


    if DialogState = dsInsert then
    begin
      ENTransportItemObj.code:=low(Integer);
      TempENTransportItem.add(ENTransportItemObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENTransportItem.save(ENTransportItemObj);
    end;
  end;
 end;


procedure TfrmENTransportItemEdit.spbTKTransportRealTransportRealClick(Sender : TObject);
var
   frmTKTransportRealShow: TfrmTKTransportRealShow;
   f : TKTransportRealFilter;
   plan : ENPlanWork;

   //TempTKTransportReal: TKTransportRealControllerSoapPort;
   //realTransportFilter : TKTransportRealFilter;
   TempENTransportItem: ENTransportItemControllerSoapPort;
   tItemFilter : ENTransportItemFilter;
   tItemList : ENTransportItemShortList;
   i : byte;
begin

   i := IDOK;
   
   plan := DMReports.getPlanByCode(ENTransportItemObj.planRef.code);

   f := TKTransportRealFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);

   // выбирем ВСЕ автомобили РЭСа ...

   //f.departmentRef := ENDepartmentRef.Create;
   //f.departmentRef.code := plan.departmentRef.code;
   //f.transport := TKTransport.Create;
   //f.transport.code := ENTransportItemObj.transport.code;

   f.conditionSQL := ' departmentrefcode in (select endepartment.code from endepartment where endepartment.rencode = '+ IntToStr(plan.departmentRef.code) +')';
   f.orderBySQL := 'gosnumber';

   frmTKTransportRealShow:=TfrmTKTransportRealShow.Create(Application,fmNormal,f);
   try
      with frmTKTransportRealShow do
        if ShowModal = mrOk then
        begin
            try
               // проверить не юзаеться ли этот транспорт на других планах ...

               tItemFilter := ENTransportItemFilter.Create;
               SetNullIntProps(tItemFilter);
               SetNullXSProps(tItemFilter);
               tItemFilter.transportReal := TKTransportReal.Create;
               tItemFilter.transportReal.code :=  StrToInt(GetReturnValue(sgTKTransportReal,0));
               tItemFilter.conditionSQL := 'entransportitem.planrefcode in (select enplanwork.code from enplanwork where enplanwork.yeargen='+ IntToStr(plan.yearGen) +' and enplanwork.monthgen='+ IntToStr(plan.monthGen)+' and enplanwork.code <> '+ IntToStr(plan.code)+')';
               TempENTransportItem := HTTPRIOENTransportItem as ENTransportItemControllerSoapPort;
               tItemList := TempENTransportItem.getScrollableFilteredList(tItemFilter,0,-1);
               if tItemList.totalCount > 0 then
               begin
                   //showMessage('Using in ' + IntToStr(tItemList.totalCount));
                   i := Application.MessageBox(PChar('Этот транспорт уже используеться в '+IntToStr(tItemList.totalCount)+' планах на этот же период! Все равно ипользовать его?'),PChar('Внимание!'), MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2);
               end;

               if i = IDOK then
               begin
                     if ENTransportItemObj.transportReal = nil then ENTransportItemObj.transportReal := TKTransportReal.Create();
                     ENTransportItemObj.transportReal.code := StrToInt(GetReturnValue(sgTKTransportReal,0));
                     edtTKTransportRealTransportRealName.Text:=GetReturnValue(sgTKTransportReal,1);
               end;

            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmTKTransportRealShow.Free;
   end;
end;



procedure TfrmENTransportItemEdit.spbENManningTableManningTableClick(Sender : TObject);
var 
   frmENManningTableShow: TfrmENManningTableShow;
   plan : ENPlanWork;
begin
{
   frmENManningTableShow:=TfrmENManningTableShow.Create(Application,fmNormal);
   try
       plan := DMReports.getPlanByCode(ENTransportItemObj.planRef.code);
       
       frmENManningTableShow.departmentFilter := ENDepartmentFilter.Create;
       SetNullIntProps(frmENManningTableShow.departmentFilter);
       SetNullXSProps(frmENManningTableShow.departmentFilter);
       frmENManningTableShow.departmentFilter.code := plan.departmentRef.code;

      with frmENManningTableShow do
        if ShowModal = mrOk then
        begin
            try
               if ENTransportItemObj.manningTable = nil then ENTransportItemObj.manningTable := ENManningTable.Create();
               ENTransportItemObj.manningTable.code := StrToInt(GetReturnValue(sgENManningTable,0));
               edtENManningTableManningTableName.Text:=GetReturnValue(sgENManningTable,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENManningTableShow.Free;
   end;
   }
end;

procedure TfrmENTransportItemEdit.spbENWorkerWorkerFactClick(Sender : TObject);
var
   frmFINWorkerShow: TfrmFINWorkerShow;
   f : FINWorkerFilter;
   plan : ENPlanWork;
   w : FINWorker;
   TempFINWorker: FINWorkerControllerSoapPort;
begin
      plan := DMReports.getPlanByCode(ENTransportItemObj.planRef.code);

      f :=FINWorkerFilter.Create;
      SetNullIntProps(f);
      SetNullXSProps(f);
{
      //f.manningTable := ENManningTable.Create;

      if ENTransportItemObj.manningTable <> nil then
      begin
       if ENTransportItemObj.manningTable.code > low(Integer) then
       begin
          f.manningTable := ENManningTable.Create;
          f.manningTable.code := ENTransportItemObj.manningTable.code;
       end
       else
          f.conditionSQL := 'manningtablecode in (select enmanningtable.code from enmanningtable where enmanningtable.departmentcode in (select endepartment.code from endepartment where endepartment.rencode = ' + intToStr(plan.departmentRef.code) + '))';
      end
      else
        f.conditionSQL := 'manningtablecode in (select enmanningtable.code from enmanningtable where enmanningtable.departmentcode in (select endepartment.code from endepartment where endepartment.rencode = ' + intToStr(plan.departmentRef.code) + '))';

      //f.conditionSQL := 'manningtablecode in (select enmanningtable.code from enmanningtable where enmanningtable.departmentcode = ' + intToStr(plan.departmentRef.code) + ')';

}

   //f.conditionSQL := 'kdv.date_uvol is null '; // только работающие ...
   //f.conditionSQL := f.conditionSQL + ' and p.podrcod = '+chr(39) + '0' + DMReports.getFinRenByDepartmentCode(plan.departmentRef.code) + chr(39) ;

   f.departmentCode :=  IntToStr(plan.departmentRef.code);

   if plan.finExecutor <> nil then
   begin
     if plan.finExecutor.code > LOW_INT then
     begin
       // MDAX-441
       if DMReports.UsesMDAXData then
         f.departmentCode := plan.finExecutor.axOrgId
       else
         f.departmentCode := intToStr( plan.finExecutor.finCode );
     end;
   end;

   frmFINWorkerShow:=TfrmFINWorkerShow.Create(Application,fmNormal,f);
   try

     frmFINWorkerShow.dateGet := TXSDate.Create;
     frmFINWorkerShow.dateGet.XSToNative(GetXSDate( EncodeDate(plan.dateStart.Year,plan.dateStart.Month,plan.dateStart.Day) ));
        
     frmFINWorkerShow.humenKindCode := ENHUMENITEMKIND_DRIVER;
     
     DisableActions([frmFINWorkerShow.actInsert, frmFINWorkerShow.actEdit, frmFINWorkerShow.actDelete]);

      with frmFINWorkerShow do
        if ShowModal = mrOk then
        begin
            try
              if ENTransportItemObj.finWorker = nil then
              begin
               ENTransportItemObj.finWorker := FINWorker.Create;
               ENTransportItemObj.finWorker.code := low(Integer); 
              end;

              ENTransportItemObj.finWorker.name := GetReturnValue(sgFINWorker,1);
              ENTransportItemObj.finWorker.tabNumber := GetReturnValue(sgFINWorker,2);
              ENTransportItemObj.finWorker.positionName := GetReturnValue(sgFINWorker,3);

              if (GetReturnValue(sgFINWorker,4) <> '') then
                ENTransportItemObj.finWorker.positionCode := StrToInt(GetReturnValue(sgFINWorker,4))
              else
                ENTransportItemObj.finWorker.positionCode := LOW_INT;

              ENTransportItemObj.finWorker.departmentName := GetReturnValue(sgFINWorker,5);
              ENTransportItemObj.finWorker.departmentCode := (GetReturnValue(sgFINWorker,6));
              if ENTransportItemObj.finWorker.priceGen = nil then ENTransportItemObj.finWorker.priceGen := TXSDecimal.Create;
              ENTransportItemObj.finWorker.priceGen.DecimalString := String(sgFINWorker.Objects[0, sgFINWorker.Row]); //GetReturnValue(sgFINWorker,7);

              if GetReturnValue(sgFINWorker,8) = '' then
                ENTransportItemObj.finWorker.categor := LOW_INT
              else
                ENTransportItemObj.finWorker.categor := StrToInt(GetReturnValue(sgFINWorker,8));

              if (GetReturnValue(sgFINWorker,9) <> '') then
                ENTransportItemObj.finWorker.finCode := StrToInt(GetReturnValue(sgFINWorker,9))
              else
                ENTransportItemObj.finWorker.finCode := LOW_INT;
  
              ENTransportItemObj.finWorker.positionId := GetReturnValue(sgFINWorker,15);

              edtENWorkerWorkerFactName.Text := ENTransportItemObj.finWorker.name;
              edtENManningTableManningTableName.Text := ENTransportItemObj.finWorker.positionName;

              isSentAssignment.Checked := false;

            {
               if ENTransportItemObj.workerFact = nil then ENTransportItemObj.workerFact := ENWorker.Create();
               ENTransportItemObj.workerFact.code := StrToInt(GetReturnValue(sgENWorker,0));
               edtENWorkerWorkerFactName.Text:=GetReturnValue(sgENWorker,1);

                if ENTransportItemObj.manningTable = nil then
                begin
                    ENTransportItemObj.manningTable := ENManningTable.Create;

                end
                else
                if ENTransportItemObj.manningTable.code = low(Integer) then
                begin
                end;

                    TempENWorker := HTTPRIOENWorker as ENWorkerControllerSoapPort;
                    w := TempENWorker.getObject(ENTransportItemObj.workerFact.code);

                    if w.manningTable <> nil then
                      ENTransportItemObj.manningTable.code := w.manningTable.code;
                      //ENTransportItemObj.workerFact.manningTable.code;
                   }
      //end;
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmFINWorkerShow.Free;
   end;
end;

{
procedure TfrmENTransportItemEdit.spbENWorkerWorkerFactClick(Sender : TObject);
var
   frmENWorkerShow: TfrmENWorkerShow;
   f : ENWorkerFilter;
   plan : ENPlanWork;
   w : ENWorker;
   TempENWorker: ENWorkerControllerSoapPort;
begin

      plan := DMReports.getPlanByCode(ENTransportItemObj.planRef.code);

      f :=ENWorkerFilter.Create;
      SetNullIntProps(f);
      SetNullXSProps(f);

      //f.manningTable := ENManningTable.Create;

      if ENTransportItemObj.manningTable <> nil then
      begin
       if ENTransportItemObj.manningTable.code > low(Integer) then
       begin
          f.manningTable := ENManningTable.Create;
          f.manningTable.code := ENTransportItemObj.manningTable.code;
       end
       else
          f.conditionSQL := 'manningtablecode in (select enmanningtable.code from enmanningtable where enmanningtable.departmentcode in (select endepartment.code from endepartment where endepartment.rencode = ' + intToStr(plan.departmentRef.code) + '))';
      end
      else
        f.conditionSQL := 'manningtablecode in (select enmanningtable.code from enmanningtable where enmanningtable.departmentcode in (select endepartment.code from endepartment where endepartment.rencode = ' + intToStr(plan.departmentRef.code) + '))';

      //f.conditionSQL := 'manningtablecode in (select enmanningtable.code from enmanningtable where enmanningtable.departmentcode = ' + intToStr(plan.departmentRef.code) + ')';


   frmENWorkerShow:=TfrmENWorkerShow.Create(Application,fmNormal,f);
   try

      with frmENWorkerShow do
        if ShowModal = mrOk then
        begin
            try
               if ENTransportItemObj.workerFact = nil then ENTransportItemObj.workerFact := ENWorker.Create();
               ENTransportItemObj.workerFact.code := StrToInt(GetReturnValue(sgENWorker,0));
               edtENWorkerWorkerFactName.Text:=GetReturnValue(sgENWorker,1);

                if ENTransportItemObj.manningTable = nil then
                begin
                    ENTransportItemObj.manningTable := ENManningTable.Create;

                end
                else
                if ENTransportItemObj.manningTable.code = low(Integer) then
                begin
                end;

                    TempENWorker := HTTPRIOENWorker as ENWorkerControllerSoapPort;
                    w := TempENWorker.getObject(ENTransportItemObj.workerFact.code);

                    if w.manningTable <> nil then
                      ENTransportItemObj.manningTable.code := w.manningTable.code;
                      //ENTransportItemObj.workerFact.manningTable.code;

      //end;
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENWorkerShow.Free;
   end;
end;
}


procedure TfrmENTransportItemEdit.spbTKTransportTransportClick(
  Sender: TObject);
var 
   frmTKTransportShow: TfrmTKTransportShow;
begin
   frmTKTransportShow:=TfrmTKTransportShow.Create(Application,fmNormal);
   try
      frmTKTransportShow.Panel2.Visible := false;
      frmTKTransportShow.Panel1.Align := alClient;
      frmTKTransportShow.tvDep.OnChange := nil; 
      DisableActions([frmTKTransportShow.actInsert, frmTKTransportShow.actEdit, frmTKTransportShow.actDelete]);
      
      with frmTKTransportShow do
        if ShowModal = mrOk then
        begin
            try
               if ENTransportItemObj.transport = nil then ENTransportItemObj.transport := TKTransport.Create();
               ENTransportItemObj.transport.code := TKTransportShort(tvDep.Selected.Data).code;//StrToInt(GetReturnValue(sgTKTransport,0));
               edtTKTransport.Text:=TKTransportShort(tvDep.Selected.Data).name;//GetReturnValue(sgTKTransport,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmTKTransportShow.Free;
   end;
end;

procedure TfrmENTransportItemEdit.pcTransportChange(Sender: TObject);
var
  TempENDistance: ENDistanceControllerSoapPort;
  i,j: Integer;
  ENDistanceList: ENDistanceShortList;
  f : ENDistanceFilter;

  TempENDeliveryOrder : ENDeliveryOrderControllerSoapPort;
  ENDeliveryOrderList: ENDeliveryOrderShortList;
  fDO : ENDeliveryOrderFilter;

begin
  inherited;

    if pcTransport.ActivePage = tsDistances then
    begin

     for i:=1 to sgENDistance.RowCount-1 do
       for j:=0 to sgENDistance.ColCount-1 do
         sgENDistance.Cells[j,i]:='';

      SetGridHeaders(ENDistanceHeaders, sgENDistance.ColumnHeaders);
      TempENDistance :=  HTTPRIOENDistance as ENDistanceControllerSoapPort;

      F := ENDistanceFilter.Create;
      SetNullIntProps(F);
      SetNullXSProps(F);


      f.transportItemRef := ENTransportItemRef.Create;
      f.transportItemRef.code := ENTransportItemObj.code;

      ENDistanceList := TempENDistance.getScrollableFilteredList(f,0,-1);

      //LastCount:=High(ENDistanceList.list);

      if High(ENDistanceList.list) > -1 then
         sgENDistance.RowCount:=High(ENDistanceList.list)+2
      else
         sgENDistance.RowCount:=2;

       with sgENDistance do
        for i:=0 to High(ENDistanceList.list) do
          begin
            Application.ProcessMessages;
            if ENDistanceList.list[i].code <> Low(Integer) then
            Cells[0,i+1] := IntToStr(ENDistanceList.list[i].code)
            else
            Cells[0,i+1] := '';

            Cells[1,i+1]  := ENDistanceList.list[i].typeRefName;
            Cells[2,i+1]  := ENDistanceList.list[i].roadTypeName;

            if ENDistanceList.list[i].distance = nil then
              Cells[3,i+1] := ''
            else
              Cells[3,i+1] := ENDistanceList.list[i].distance.DecimalString;

            sgENDistance.RowCount:=High(ENDistanceList.list)+2;
          end;

       sgENDistance.Row:=1;
    end;

// -------------------------------------------------------------

if pcTransport.ActivePage = tsDelivery then
begin

 for i:=1 to sgENDeliveryOrder.RowCount-1 do
   for j:=0 to sgENDeliveryOrder.ColCount-1 do
     sgENDeliveryOrder.Cells[j,i]:='';

  SetGridHeaders(ENDeliveryOrderHeaders, sgENDeliveryOrder.ColumnHeaders);
  TempENDeliveryOrder :=  HTTPRIOENDeliveryOrder as ENDeliveryOrderControllerSoapPort;

  FDO := ENDeliveryOrderFilter.Create;
  SetNullIntProps(Fdo);
  SetNullXSProps(Fdo);


  fdo.transportInRef := ENTransportItemRef.Create;
  fdo.transportInRef.code := ENTransportItemObj.code;

  ENDeliveryOrderList := TempENDeliveryOrder.getScrollableFilteredList(fdo,0,-1);

  //LastCount:=High(ENDistanceList.list);

  if High(ENDeliveryOrderList.list) > -1 then
     sgENDeliveryOrder.RowCount:=High(ENDeliveryOrderList.list)+2
  else
     sgENDeliveryOrder.RowCount:=2;

   with sgENDeliveryOrder do
    for i:=0 to High(ENDeliveryOrderList.list) do
      begin
        Application.ProcessMessages;
        if ENDeliveryOrderList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENDeliveryOrderList.list[i].code)
        else
        Cells[0,i+1] := '';

        Cells[1, i + 1] := ENDeliveryOrderList.list[i].outGosNomer;
        Cells[2, i + 1] := ENDeliveryOrderList.list[i].outName;
        Cells[3, i + 1] := ENDeliveryOrderList.list[i].outDriverName;
        Cells[4, i + 1] := ENDeliveryOrderList.list[i].outObject;
        Cells[5, i + 1] := ENDeliveryOrderList.list[i].outInvNumber;

        if ENDeliveryOrderList.list[i].outDistance <> nil then
           Cells[6, i + 1] := ENDeliveryOrderList.list[i].outDistance.DecimalString
        else
           Cells[6, i + 1] := '';

{

        ( 'Код'
        , 'гос.№'
        ,'Назва'
        ,'Водій'
        ,'Об"єкт'
        ,'Інв.№ об"єкту'
        ,'Загальна відстань, км'
        );

        Cells[1,i+1]  := ENDistanceList.list[i].typeRefName;
        Cells[2,i+1]  := ENDistanceList.list[i].roadTypeName;

        if ENDistanceList.list[i].distance = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := ENDistanceList.list[i].distance.DecimalString;
}
        sgENDeliveryOrder.RowCount:=High(ENDeliveryOrderList.list)+2;
      end;

   sgENDeliveryOrder.Row:=1;


end;



end;




procedure TfrmENTransportItemEdit.actEditExecute(Sender: TObject);
Var TempENDistance: ENDistanceControllerSoapPort;
begin

if pcTransport.ActivePage = tsDistances then
begin
 TempENDistance := HTTPRIOENDistance as ENDistanceControllerSoapPort;
   try
     ENDistanceObj := TempENDistance.getObject(StrToInt(sgENDistance.Cells[0,sgENDistance.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENDistanceEdit:=TfrmENDistanceEdit.Create(Application, dsEdit);
  try
    if frmENDistanceEdit.ShowModal= mrOk then
      begin
        //TempENDistance.save(ENDistanceObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENDistanceEdit.Free;
    frmENDistanceEdit:=nil;
  end;
end;

// ----------------------------------------
if pcTransport.ActivePage = tsDelivery then
begin

end;


end;

procedure TfrmENTransportItemEdit.actDeleteExecute(Sender: TObject);
Var
  TempENDistance: ENDistanceControllerSoapPort;
  TempENDeliveryOrder : ENDeliveryOrderControllerSoapPort;
  ObjCode: Integer;
begin
if pcTransport.ActivePage = tsDistances then
begin
 TempENDistance := HTTPRIOENDistance as ENDistanceControllerSoapPort;
   try
     ObjCode := StrToInt(sgENDistance.Cells[0,sgENDistance.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Відстані) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENDistance.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

// ---------------------------------------

if pcTransport.ActivePage = tsDelivery then
begin
  TempENDeliveryOrder := HTTPRIOENDeliveryOrder as ENDeliveryOrderControllerSoapPort;
   try
     ObjCode := StrToInt(sgENDeliveryOrder.Cells[0,sgENDeliveryOrder.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Сумісну доставку) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENDeliveryOrder.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

end;

procedure TfrmENTransportItemEdit.UpdateGrid(Sender: TObject);
//ar i, j: Integer;
begin
{
 for i:=1 to sgENDistance.RowCount-1 do
   for j:=0 to sgENDistance.ColCount-1 do
     sgENDistance.Cells[j,i]:='';
   FormShow(Sender);
}

 pcTransportChange(Sender);
 recalcDistances();
end;

procedure TfrmENTransportItemEdit.actInsertExecute(Sender: TObject);
Var
  TempENDistance: ENDistanceControllerSoapPort;
  TempENDeliveryOrder : ENDeliveryOrderControllerSoapPort;
begin

if pcTransport.ActivePage = tsDistances then
begin
  TempENDistance := HTTPRIOENDistance as ENDistanceControllerSoapPort;
  ENDistanceObj:=ENDistance.Create;

   ENDistanceObj.distance:= TXSDecimal.Create;

   ENDistanceObj.transportItemRef := ENTransportItemRef.Create;
   ENDistanceObj.transportItemRef.code := ENTransportItemObj.code;

  try
    frmENDistanceEdit:=TfrmENDistanceEdit.Create(Application, dsInsert);
    try
      if frmENDistanceEdit.ShowModal = mrOk then
      begin
        if ENDistanceObj<>nil then
            //TempENDistance.add(ENDistanceObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENDistanceEdit.Free;
      frmENDistanceEdit:=nil;
    end;
  finally
    ENDistanceObj.Free;
  end;
end;

//-------------------------------------------

if pcTransport.ActivePage = tsDelivery then
begin

 if  ENTransportItemObj.transportReal = nil then
 begin
   ShowMessage('Укажите реальный транспорт !!!');
   exit;
 end;

 if  ENTransportItemObj.transportReal.code <= 0 then
 begin
   ShowMessage('Укажите реальный транспорт !!!');
   exit;
 end;


 TempENDeliveryOrder := HTTPRIOENDeliveryOrder as ENDeliveryOrderControllerSoapPort;

 ENDeliveryOrderObj := ENDeliveryOrder.Create;
 SetNullIntProps(ENDeliveryOrderObj);
 SetNullXSProps(ENDeliveryOrderObj);

 ENDeliveryOrderObj.transportInRef := ENTransportItemRef.Create;
 ENDeliveryOrderObj.transportInRef.code := ENTransportItemObj.code;

  try
    frmENDeliveryOrderEdit:=TfrmENDeliveryOrderEdit.Create(Application, dsInsert);
    try

      frmENDeliveryOrderEdit.inTransport := ENTransportItemObj;

      if frmENDeliveryOrderEdit.ShowModal = mrOk then
      begin
        if ENDeliveryOrderObj<>nil then
            //TempENDistance.add(ENDistanceObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENDeliveryOrderEdit.Free;
      frmENDeliveryOrderEdit:=nil;
    end;
  finally
    ENDeliveryOrderObj.Free;
  end;
end;
// -----------------------------------

end;



procedure TfrmENTransportItemEdit.actViewExecute(Sender: TObject);
Var
  TempENDistance: ENDistanceControllerSoapPort;
  TempENDeliveryOrder : ENDeliveryOrderControllerSoapPort;
begin

if pcTransport.ActivePage = tsDistances then
begin
 TempENDistance := HTTPRIOENDistance as ENDistanceControllerSoapPort;
   try
     ENDistanceObj := TempENDistance.getObject(StrToInt(sgENDistance.Cells[0,sgENDistance.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENDistanceEdit:=TfrmENDistanceEdit.Create(Application, dsView);
  try
    frmENDistanceEdit.ShowModal;
  finally
    frmENDistanceEdit.Free;
    frmENDistanceEdit:=nil;
  end;
end;
// ------------------------------------------------
if pcTransport.ActivePage = tsDelivery then
begin

 exit;

 TempENDeliveryOrder := HTTPRIOENDeliveryOrder as ENDeliveryOrderControllerSoapPort;
   try
     ENDeliveryOrderObj := TempENDeliveryOrder.getObject(StrToInt(sgENDeliveryOrder.Cells[0,sgENDeliveryOrder.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENDeliveryOrderEdit:=TfrmENDeliveryOrderEdit.Create(Application, dsView);
  try
    frmENDeliveryOrderEdit.ShowModal;
  finally
    frmENDeliveryOrderEdit.Free;
    frmENDeliveryOrderEdit:=nil;
  end;
end;

end;

procedure TfrmENTransportItemEdit.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;

procedure TfrmENTransportItemEdit.spbTransportRealClearClick(
  Sender: TObject);
begin

  if ENTransportItemObj.transportReal <> nil then
  begin
     ENTransportItemObj.transportReal.code := LOW_INT;
     edtTKTransportRealTransportRealName.Text := '';
  end;

end;

procedure TfrmENTransportItemEdit.spbFINWorkerClearClick(Sender: TObject);
begin

  if ENTransportItemObj.finWorker <> nil then
  begin
     ENTransportItemObj.finWorker.code := LOW_INT;
     ENTransportItemObj.finWorker.tabNumber := '';
     edtENWorkerWorkerFactName.Text := '';
     isSentAssignment.Checked := false;
  end;

end;




procedure TfrmENTransportItemEdit.spbTrailerRealClick(Sender: TObject);
var
   frmTKTransportRealShow: TfrmTKTransportRealShow;
   f : TKTransportRealFilter;
   plan : ENPlanWork;

   //TempTKTransportReal: TKTransportRealControllerSoapPort;
   //realTransportFilter : TKTransportRealFilter;
   TempENTransportItem: ENTransportItemControllerSoapPort;
   tItemFilter : ENTransportItemFilter;
   tItemList : ENTransportItemShortList;
   i : byte;
begin

   i := IDOK;
   
   plan := DMReports.getPlanByCode(ENTransportItemObj.planRef.code);

   f := TKTransportRealFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);

   // выбирем ВСЕ автомобили РЭСа ...

   //f.departmentRef := ENDepartmentRef.Create;
   //f.departmentRef.code := plan.departmentRef.code;
   //f.transport := TKTransport.Create;
   //f.transport.code := ENTransportItemObj.transport.code;

   f.conditionSQL := ' departmentrefcode in (select endepartment.code from endepartment where endepartment.rencode = '+ IntToStr(plan.departmentRef.code) +')';
   f.orderBySQL := 'gosnumber';

   frmTKTransportRealShow:=TfrmTKTransportRealShow.Create(Application,fmNormal,f);
   try
      with frmTKTransportRealShow do
        if ShowModal = mrOk then
        begin
            try
               // проверить не юзаеться ли этот транспорт на других планах ...
               
               tItemFilter := ENTransportItemFilter.Create;
               SetNullIntProps(tItemFilter);
               SetNullXSProps(tItemFilter);
               tItemFilter.trailerTransportReal := TKTransportReal.Create;
               tItemFilter.trailerTransportReal.code :=  StrToInt(GetReturnValue(sgTKTransportReal,0));
               tItemFilter.conditionSQL := 'entransportitem.planrefcode in (select enplanwork.code from enplanwork where enplanwork.yeargen='+ IntToStr(plan.yearGen) +' and enplanwork.monthgen='+ IntToStr(plan.monthGen)+' and enplanwork.code <> '+ IntToStr(plan.code)+')';
               TempENTransportItem := HTTPRIOENTransportItem as ENTransportItemControllerSoapPort;
               tItemList := TempENTransportItem.getScrollableFilteredList(tItemFilter,0,-1);
               if tItemList.totalCount > 0 then
               begin
                   //showMessage('Using in ' + IntToStr(tItemList.totalCount));
                   i := Application.MessageBox(PChar('Этот транспорт уже используеться в '+IntToStr(tItemList.totalCount)+' планах на этот же период! Все равно ипользовать его?'),PChar('Внимание!'), MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2);
               end;

               if i = IDOK then
               begin
                     if ENTransportItemObj.trailerTransportReal = nil then ENTransportItemObj.trailerTransportReal := TKTransportReal.Create();
                     ENTransportItemObj.trailerTransportReal.code := StrToInt(GetReturnValue(sgTKTransportReal,0));
                     edtTrailerRealName.Text:=GetReturnValue(sgTKTransportReal,1);
               end;

            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmTKTransportRealShow.Free;
   end;
end;

procedure TfrmENTransportItemEdit.spbTrailerRealClearClick(
  Sender: TObject);
begin
  if ENTransportItemObj.trailerTransportReal <> nil then
  begin
     ENTransportItemObj.trailerTransportReal.code := LOW_INT;
     edtTrailerRealName.Text := '';
  end;

end;

end.
