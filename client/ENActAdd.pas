unit ENActAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, StdCtrls, Grids, AdvObj, BaseGrid, AdvGrid , GridHeadersUnit,
  InvokeRegistry, Rio, SOAPHTTPClient  , ENServicesObjectController, ActnList,
  Menus, ComCtrls, ToolWin, ImgList ,XSBuiltIns ;

type
  TfrmENActAdd = class(TDialogForm)
    sgENAct: TAdvStringGrid;
    btnSave: TButton;
    btnCancel: TButton;
    HTTPRIOENAct: THTTPRIO;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    ActionList1: TActionList;
    actView: TAction;
    actInsert: TAction;
    actDelete: TAction;
    actEdit: TAction;
    actUpdate: TAction;
    actFilter: TAction;
    actNoFilter: TAction;
    actUpdateGridAct: TAction;
    actUpdateGridActProject: TAction;
    actInsertDateForActProject: TAction;
    actUpdateGridDateForActProject: TAction;
    actDeleteDateForActProject: TAction;
    actisCalculationDateTrue: TAction;
    actisCalculationDateFalse: TAction;
    ImageList1: TImageList;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton11: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    HTTPRIOENServicesObject: THTTPRIO;
    HTTPRIOENReconstrModernOZ2ENact: THTTPRIO;
    HTTPRIOENBuilding2ENact: THTTPRIO;
    procedure FormShow(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
    ENServicesConnectionObj: ENServicesObject;
  public
    { Public declarations }
    invNumberOZ:String;
    servicesobjectcode:Integer;
    ENReconstrModernOZObjCode:Integer;
    ENBuildingObjCode:Integer;
    isOz1:Boolean;
    EnServicesObjectStrCode:String;  /// for enbuilding

  end;

var
  frmENActAdd: TfrmENActAdd;
  LastRow: Integer = 1;

implementation

uses ENActController, ENConsts, ENElementController, EditENAct,
  ENReconstrModernOZ2ENactController, ENReconstrModernOZController,
  ENBuilding2ENactController , ENBuildingController ;

{$R *.dfm}

procedure TfrmENActAdd.actViewExecute(Sender: TObject);
Var TempENAct: ENActControllerSoapPort;
begin
  TempENAct := HTTPRIOENAct as ENActControllerSoapPort;

  frmENActEdit:=TfrmENActEdit.Create(Application, dsView);
  try
    DisableActions([frmENActEdit.actDelete]);
    try
      frmENActEdit.ENActObj := TempENAct.getObject(StrToInt(sgENAct.Cells[0,sgENAct.Row]));
    except
      on EConvertError do Exit;
    end;

    if frmENActEdit.ShowModal in [mrOk ,mrYes ] then
      begin


      end;

  finally
    frmENActEdit.Free;
    frmENActEdit:=nil;
  end;

end;

procedure TfrmENActAdd.btnCancelClick(Sender: TObject);
begin
  inherited;
   frmENActAdd.close;
end;

procedure TfrmENActAdd.btnSaveClick(Sender: TObject);
var
i : integer;
r2a  : ENReconstrModernOZ2ENact;
TempENReconstrModernOZ2ENact : ENReconstrModernOZ2ENactControllerSoapPort;
state_ : Boolean;
b2a  : ENBuilding2ENact;
TempENBuilding2ENact : ENBuilding2ENactControllerSoapPort;
begin
  inherited;
if isoz1 then
begin
      TempENBuilding2ENact := HTTPRIOENBuilding2ENact as ENBuilding2ENactControllerSoapPort;


      for i:=1 to sgENAct.RowCount - 1 do
    begin
        sgENAct.GetCheckBoxState(1,i,state_);
       if state_ then
       begin
            b2a:=ENBuilding2ENact.Create;
            b2a.actRef := ENActRef.Create;
            b2a.ENBuildingRef :=  ENBuildingRef.Create;

            b2a.code := LOW_INT;
            b2a.ENBuildingRef.code := ENBuildingObjCode;
            b2a.actRef.code := StrToInt(sgENAct.Cells[0,i]);

            b2a.isActFromEnergyNET := TXSBoolean.Create;
            b2a.isActFromEnergyNET.asBoolean :=  true;


            TempENBuilding2ENact.add(b2a);


       end;
    end;



end
  else
  begin
     TempENReconstrModernOZ2ENact := HTTPRIOENReconstrModernOZ2ENact as ENReconstrModernOZ2ENactControllerSoapPort;
    for i:=1 to sgENAct.RowCount - 1 do
    begin
        sgENAct.GetCheckBoxState(1,i,state_);
       if state_ then
       begin
          r2a:=ENReconstrModernOZ2ENact.Create;
          r2a.actRef := ENActRef.Create;
          r2a.ENReconstrModernOZRef :=  ENReconstrModernOZRef.Create;

          r2a.code := LOW_INT;
          r2a.ENReconstrModernOZRef.code := ENReconstrModernOZObjCode;
          r2a.actRef.code := StrToInt(sgENAct.Cells[0,i]);

          TempENReconstrModernOZ2ENact.add(r2a);
       end;
    end;
   end;
     FormShow(sender);



end;

procedure TfrmENActAdd.FormShow(Sender: TObject);
var
  TempENAct: ENActControllerSoapPort;
  i , ColCount ,LastCount : Integer;
  ENActList: ENActShortList;
  actFilter : ENActFilter;
  TempENServicesCalculation: ENServicesObjectControllerSoapPort;
  actDate: String;
  begin
  SetGridHeaders(ENActHeadersAddAct, sgENAct.ColumnHeaders);
  ClearGrid(sgENAct);
  TempENServicesCalculation := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
  if (servicesobjectcode <>LOW_INT) then
  begin
   try
     ENServicesConnectionObj := TempENServicesCalculation.getObject(servicesobjectcode);
   except
   on EConvertError do Exit;
   end;
  end;


  // SUPP-78694 наведем небольшую красоту - дл€ первого р€да
  // сделаем автоматическую установку размера по содержимому
  sgENAct.AutoSizeRow(0);

  ColCount:=10000;
  TempENAct :=  HTTPRIOENAct as ENActControllerSoapPort;


     actFilter := ENActFilter.Create;
     SetNullIntProps(actFilter);
     SetNullXSProps(actFilter);

     if not isoz1 then
     begin
       if(servicesobjectcode = LOW_INT) then // реконструкци€ если Ќ≈  присоедидение
       begin
          actFilter.conditionSQL := ' enact.code in ( Select a.code from enact a  , enelementdata eld   ' +
                                ' where a.elementcode = eld.ecode ' +
                                ' and a.acttyperefcode in ( ' + IntToStr(ENPLANWORKSTATE_RECONSTRUCTION) + ' ,  ' + IntToStr(ENPLANWORKSTATE_TMC_TRANSFER) + ' )  ' +
                                ' and eld.invnumber = ' +chr(39)+ invNumberOZ +chr(39) +
                                ' and a.statusrefcode in (' + IntToStr( ENACT_CLOSED) + ',' + IntToStr(ENACT_SIGNATURE) + ')' +
                                ' and a.code not in (select distinct r2a.actrefcode from enreconstrmodernoz2nct r2a where r2a.actrefcode = a.code )   )';

       end
        else
       begin

          if ENServicesConnectionObj = nil then Exit;
          if ENServicesConnectionObj.element = nil then Exit;
          if ENServicesConnectionObj.element.code = LOW_INT then Exit;

         actFilter.conditionSQL := '  enact.code not in (select distinct r2a.actrefcode from enreconstrmodernoz2nct r2a where enact.code = r2a.actrefcode )  ' +
           ' and enact.acttyperefcode not in (3, 7 , 1 , 4 ) ' +
           ' and enact.elementcode in (select ecode from enelementdata where enelementdata.invnumber = ' +chr(39)+ invNumberOZ +chr(39) + ' ) '+
           ' and enact.code in ( ' +
           ' select aa.code from enact aa where aa.elementcode= ' + IntToStr( ENServicesConnectionObj.element.code ) +
           ' union ' +
           ' select a.code from enact a where a.code in ( select a2pl.actrefcode from enact2enplanwork a2pl ' +
           '                                                         where a2pl.plancode in ( select ct2pl.planrefcode from entechcond2planwork ct2pl ' +
           '                                                                                   where ct2pl.techconservicesrefcode in (select s2t.techcondservrefcode from enservicesobject2techcondtnsservices s2t , enservicesobject so ' +
           '                                                                                                                           where s2t.servicesobjectrefcode = so.code ' +
           '                                                                                                                           and so.elementcode = ' + IntToStr( ENServicesConnectionObj.element.code ) +
           '                                                                                                                         )  ' +
           '                                                                                   )) ' +
           ' union ' +
           ' select a.code from enact a  where a.code in ( select f2p.actcode from entechcond2planwork ct2pl , rqfkorder2planfact f2p ' +
           '                            where ct2pl.planrefcode=f2p.plancode ' +
           '                              and ct2pl.techconservicesrefcode in (select s2t.techcondservrefcode from enservicesobject2techcondtnsservices s2t , enservicesobject so ' +
           '                                                                                                                           where s2t.servicesobjectrefcode = so.code ' +
           '                                                                                                                           and so.elementcode = ' + IntToStr( ENServicesConnectionObj.element.code ) +
           '                                                                                                                         ) )  ' +
           '   )  ' ;




       end;
     end;

     if(isoz1) then
     begin
        // если оз-1 , строительство
      if (ENReconstrModernOZObjCode <> LOW_INT ) then
       begin
            if length(EnServicesObjectStrCode) = 0 then Exit;

           actFilter.conditionSQL := '  enact.code not in (select distinct b2a.actrefcode from enbuilding2enact b2a where b2a.actrefcode = enact.code )  ' +
             ' and enact.acttyperefcode in (1,4,29) ' +
             ' and enact.code in ( ' +
             ' select aa.code from enact aa where aa.elementcode in ( select ff.elementcode from enservicesobject ff where ff.code in ('+EnServicesObjectStrCode+') '+ ')' +
             ' union ' +
             ' select a.code from enact a where a.code in ( select a2pl.actrefcode from enact2enplanwork a2pl ' +
             '                                                         where a2pl.plancode in ( select ct2pl.planrefcode from entechcond2planwork ct2pl ' +
             '                                                                                   where ct2pl.techconservicesrefcode in (select s2t.techcondservrefcode from enservicesobject2techcondtnsservices s2t , enservicesobject so ' +
             '                                                                                                                           where s2t.servicesobjectrefcode = so.code ' +
             '                                                                                                                           and so.elementcode in ( select ff.elementcode from enservicesobject ff where ff.code in ('+EnServicesObjectStrCode+') '+ ')' +
             '                                                                                                                         )  ' +
             '                                                                                   )) ' +
             ' union ' +
             ' select a.code from enact a  where a.code in ( select f2p.actcode from entechcond2planwork ct2pl , rqfkorder2planfact f2p ' +
             '                            where ct2pl.planrefcode=f2p.plancode ' +
             '                              and ct2pl.techconservicesrefcode in (select s2t.techcondservrefcode from enservicesobject2techcondtnsservices s2t , enservicesobject so ' +
             '                                                                                                                           where s2t.servicesobjectrefcode = so.code ' +
             '                                                                                                                           and so.elementcode in ( select ff.elementcode from enservicesobject ff where ff.code in ('+EnServicesObjectStrCode+') '+ ')'  +
             '                                                                                                                         ) )  ' +
             '   )  ' ;
       end;
     end;



            actDate := '';

            TempENAct := HTTPRIOENAct as ENActControllerSoapPort;
            ENActList := TempENAct.getScrollableFilteredList(actFilter, 0, -1);

            LastCount := High(ENActList.list);

            if LastCount > -1 then
              sgENAct.RowCount := LastCount + 2
            else
              sgENAct.RowCount := 2;

            with sgENAct do
              for i:=0 to LastCount do
              begin
                Application.ProcessMessages;
                if ENActList.list[i].code <> Low(Integer) then
                  Cells[0,i+1] := IntToStr(ENActList.list[i].code)
                else
                  Cells[0,i+1] := '';
                Cells[1,i+1] := ENActList.list[i].numberGen;
                AddCheckBox(1,i+1, false, false);
                if ENActList.list[i].dateGen = nil then
                  Cells[2,i+1] := ''
                else
                  Cells[2,i+1] := XSDate2String(ENActList.list[i].dateGen);

                if (i = 0) then
                  actDate := Cells[2, i + 1];

                Cells[3,i+1] := ENActList.list[i].invNumber;

                Cells[4,i+1] := ENActList.list[i].finMolName;
                Cells[5,i+1] := ENActList.list[i].actTypeRefName;
                Cells[6,i+1] := ENActList.list[i].statusRefName;

                sgENAct.RowCount := i + 2;
              end;

            sgENAct.Row := 1;
     

        {  ENActList := TempENAct.getScrollableFilteredList(actFilter,0,ColCount);


          LastCount:=High(ENActList.list);

          if LastCount > -1 then
             sgENAct.RowCount:=LastCount+2
          else
             sgENAct.RowCount:=2;

           with sgENAct do
            for i:=0 to LastCount do
              begin
                Application.ProcessMessages;
                if ENActList.list[i].code <> Low(Integer) then
                Cells[0,i+1] := IntToStr(ENActList.list[i].code)
                else
                Cells[0,i+1] := '';
                Cells[1,i+1] := ENActList.list[i].numberGen;
                if ENActList.list[i].dateGen = nil then
                  Cells[2,i+1] := ''
                else
                  Cells[2,i+1] := XSDate2String(ENActList.list[i].dateGen);

                  if ENActList.list[i].dateAct = nil then
                  Cells[3,i+1] := ''
                else
                  Cells[3,i+1] := XSDate2String(ENActList.list[i].dateAct);

                Cells[4,i+1] :=  ENActList.list[i].finMolCode + ' / ' +  ENActList.list[i].finMolName;

                Cells[5,i+1] := ENActList.list[i].actTypeRefName; //'';
                Cells[6, i+1] := ENActList.list[i].statusRefName;

                if (Assigned(ENActList.list[i].checkedByAccountant))
                  and (ENActList.list[i].checkedByAccountant.AsBoolean = true) then
                  Cells[7,i+1] := '“ак'
                else
                  Cells[7,i+1] := '';

                Cells[8, i+1] := ENActList.list[i].userGen;

                if ENActList.list[i].dateEdit = nil then
                  Cells[9,i+1] := ''
                else
                  Cells[9,i+1] := XSDate2String(ENActList.list[i].dateEdit);

                Objects[0, i+1] := ENActList.list[i];

                LastRow:=i+1;
                sgENAct.RowCount:=LastRow+1;
              end;
           ColCount:=ColCount+1;
           sgENAct.Row:=1;  }
end;

end.
